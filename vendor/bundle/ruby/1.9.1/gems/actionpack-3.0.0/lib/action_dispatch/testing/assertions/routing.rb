# -*- encoding : utf-8 -*-
require 'uri'
require 'active_support/core_ext/hash/diff'
require 'active_support/core_ext/hash/indifferent_access'

module ActionDispatch
  module Assertions
    # Suite of assertions to test routes generated by \Rails and the handling of requests made to them.
    module RoutingAssertions
      # Asserts that the routing of the given +path+ was handled correctly and that the parsed options (given in the +expected_options+ hash)
      # match +path+.  Basically, it asserts that \Rails recognizes the route given by +expected_options+.
      #
      # Pass a hash in the second argument (+path+) to specify the request method.  This is useful for routes
      # requiring a specific HTTP method.  The hash should contain a :path with the incoming request path
      # and a :method containing the required HTTP verb.
      #
      #   # assert that POSTing to /items will call the create action on ItemsController
      #   assert_recognizes({:controller => 'items', :action => 'create'}, {:path => 'items', :method => :post})
      #
      # You can also pass in +extras+ with a hash containing URL parameters that would normally be in the query string.  This can be used
      # to assert that values in the query string string will end up in the params hash correctly.  To test query strings you must use the
      # extras argument, appending the query string on the path directly will not work.  For example:
      #
      #   # assert that a path of '/items/list/1?view=print' returns the correct options
      #   assert_recognizes({:controller => 'items', :action => 'list', :id => '1', :view => 'print'}, 'items/list/1', { :view => "print" })
      #
      # The +message+ parameter allows you to pass in an error message that is displayed upon failure.
      #
      # ==== Examples
      #   # Check the default route (i.e., the index action)
      #   assert_recognizes({:controller => 'items', :action => 'index'}, 'items')
      #
      #   # Test a specific action
      #   assert_recognizes({:controller => 'items', :action => 'list'}, 'items/list')
      #
      #   # Test an action with a parameter
      #   assert_recognizes({:controller => 'items', :action => 'destroy', :id => '1'}, 'items/destroy/1')
      #
      #   # Test a custom route
      #   assert_recognizes({:controller => 'items', :action => 'show', :id => '1'}, 'view/item1')
      #
      #   # Check a Simply RESTful generated route
      #   assert_recognizes list_items_url, 'items/list'
      def assert_recognizes(expected_options, path, extras={}, message=nil)
        request = recognized_request_for(path)

        expected_options = expected_options.clone
        extras.each_key { |key| expected_options.delete key } unless extras.nil?

        expected_options.stringify_keys!
        msg = build_message(message, "The recognized options <?> did not match <?>, difference: <?>",
            request.path_parameters, expected_options, expected_options.diff(request.path_parameters))
        assert_block(msg) { request.path_parameters == expected_options }
      end

      # Asserts that the provided options can be used to generate the provided path.  This is the inverse of +assert_recognizes+.
      # The +extras+ parameter is used to tell the request the names and values of additional request parameters that would be in
      # a query string. The +message+ parameter allows you to specify a custom error message for assertion failures.
      #
      # The +defaults+ parameter is unused.
      #
      # ==== Examples
      #   # Asserts that the default action is generated for a route with no action
      #   assert_generates "/items", :controller => "items", :action => "index"
      #
      #   # Tests that the list action is properly routed
      #   assert_generates "/items/list", :controller => "items", :action => "list"
      #
      #   # Tests the generation of a route with a parameter
      #   assert_generates "/items/list/1", { :controller => "items", :action => "list", :id => "1" }
      #
      #   # Asserts that the generated route gives us our custom route
      #   assert_generates "changesets/12", { :controller => 'scm', :action => 'show_diff', :revision => "12" }
      def assert_generates(expected_path, options, defaults={}, extras = {}, message=nil)
        if expected_path =~ %r{://}
          begin
            uri = URI.parse(expected_path)
            expected_path = uri.path.to_s.empty? ? "/" : uri.path
          rescue URI::InvalidURIError => e
            raise ActionController::RoutingError, e.message
          end
        else
          expected_path = "/#{expected_path}" unless expected_path.first == '/'
        end
        # Load routes.rb if it hasn't been loaded.

        generated_path, extra_keys = @routes.generate_extras(options, defaults)
        found_extras = options.reject {|k, v| ! extra_keys.include? k}

        msg = build_message(message, "found extras <?>, not <?>", found_extras, extras)
        assert_block(msg) { found_extras == extras }

        msg = build_message(message, "The generated path <?> did not match <?>", generated_path,
            expected_path)
        assert_block(msg) { expected_path == generated_path }
      end

      # Asserts that path and options match both ways; in other words, it verifies that <tt>path</tt> generates
      # <tt>options</tt> and then that <tt>options</tt> generates <tt>path</tt>.  This essentially combines +assert_recognizes+
      # and +assert_generates+ into one step.
      #
      # The +extras+ hash allows you to specify options that would normally be provided as a query string to the action.  The
      # +message+ parameter allows you to specify a custom error message to display upon failure.
      #
      # ==== Examples
      #  # Assert a basic route: a controller with the default action (index)
      #  assert_routing '/home', :controller => 'home', :action => 'index'
      #
      #  # Test a route generated with a specific controller, action, and parameter (id)
      #  assert_routing '/entries/show/23', :controller => 'entries', :action => 'show', :id => 23
      #
      #  # Assert a basic route (controller + default action), with an error message if it fails
      #  assert_routing '/store', { :controller => 'store', :action => 'index' }, {}, {}, 'Route for store index not generated properly'
      #
      #  # Tests a route, providing a defaults hash
      #  assert_routing 'controller/action/9', {:id => "9", :item => "square"}, {:controller => "controller", :action => "action"}, {}, {:item => "square"}
      #
      #  # Tests a route with a HTTP method
      #  assert_routing({ :method => 'put', :path => '/product/321' }, { :controller => "product", :action => "update", :id => "321" })
      def assert_routing(path, options, defaults={}, extras={}, message=nil)
        assert_recognizes(options, path, extras, message)

        controller, default_controller = options[:controller], defaults[:controller]
        if controller && controller.include?(?/) && default_controller && default_controller.include?(?/)
          options[:controller] = "/#{controller}"
        end

        assert_generates(path.is_a?(Hash) ? path[:path] : path, options, defaults, extras, message)
      end

      # A helper to make it easier to test different route configurations.
      # This method temporarily replaces @routes
      # with a new RouteSet instance.
      #
      # The new instance is yielded to the passed block. Typically the block
      # will create some routes using <tt>map.draw { map.connect ... }</tt>:
      #
      #   with_routing do |set|
      #     set.draw do |map|
      #       map.connect ':controller/:action/:id'
      #         assert_equal(
      #           ['/content/10/show', {}],
      #           map.generate(:controller => 'content', :id => 10, :action => 'show')
      #       end
      #     end
      #   end
      #
      def with_routing
        old_routes, @routes = @routes, ActionDispatch::Routing::RouteSet.new
        old_controller, @controller = @controller, @controller.clone if @controller
        _routes = @routes

        # Unfortunately, there is currently an abstraction leak between AC::Base
        # and AV::Base which requires having the URL helpers in both AC and AV.
        # To do this safely at runtime for tests, we need to bump up the helper serial
        # to that the old AV subclass isn't cached.
        #
        # TODO: Make this unnecessary
        if @controller
          @controller.singleton_class.send(:include, _routes.url_helpers)
          @controller.view_context_class = Class.new(@controller.view_context_class) do
            include _routes.url_helpers
          end
        end
        yield @routes
      ensure
        @routes = old_routes
        if @controller
          @controller = old_controller
        end
      end

      # ROUTES TODO: These assertions should really work in an integration context
      def method_missing(selector, *args, &block)
        if @controller && @routes && @routes.named_routes.helpers.include?(selector)
          @controller.send(selector, *args, &block)
        else
          super
        end
      end

      private
        # Recognizes the route for a given path.
        def recognized_request_for(path)
          if path.is_a?(Hash)
            method = path[:method]
            path   = path[:path]
          else
            method = :get
          end

          # Assume given controller
          request = ActionController::TestRequest.new

          if path =~ %r{://}
            begin
              uri = URI.parse(path)
              request.env["rack.url_scheme"] = uri.scheme || "http"
              request.host = uri.host if uri.host
              request.port = uri.port if uri.port
              request.path = uri.path.to_s.empty? ? "/" : uri.path
            rescue URI::InvalidURIError => e
              raise ActionController::RoutingError, e.message
            end
          else
            path = "/#{path}" unless path.first == "/"
            request.path = path
          end

          request.request_method = method if method

          params = @routes.recognize_path(path, { :method => method })
          request.path_parameters = params.with_indifferent_access

          request
        end
    end
  end
end
