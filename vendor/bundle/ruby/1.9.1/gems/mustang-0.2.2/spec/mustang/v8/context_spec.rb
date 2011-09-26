require File.dirname(__FILE__) + '/../../spec_helper'

describe Mustang::V8::Context do
  describe ".new" do
    it "creates new context and enters it" do
      cxt = Mustang::V8::Context.new
      cxt.should be_entered
    end
  end

  describe "#evaluate" do
    it "evaluates given javascript source" do
      subject.evaluate("var a = 'foo'; a;", "<eval>").should == 'foo'
    end

    it "returns result converted to ruby object" do
      result = subject.evaluate("'foo'", "<eval>")
      result.should be_kind_of(Mustang::V8::String)
      result.to_s.should == 'foo'
    end

    it "is aliased by #eval" do
      subject.eval("'foo'", "<eval>").should == 'foo'
    end
  end

  describe "#[]" do
    it "gets value of specified variable from the global prototype" do
      subject.evaluate("var foo='bar'", "<eval>")
      subject['foo'].should == 'bar'
    end

    it "is aliased by #get" do
      subject.evaluate("var foo='bar'", "<eval>")
      subject.get('foo').should == 'bar'
    end
  end

  describe "#[]=" do
    it "stores given variable within the global prototype" do
      subject["foo"] = "bar"
      subject.evaluate("foo", "<eval>").should == "bar"
      subject[:spam] = :eggs
      subject.evaluate("spam", "<eval>").should == "eggs"
    end

    it "is aliased by #set" do
      subject.set(:foo, "bar")
      subject.evaluate("foo", "<eval>").should == "bar"
    end
  end

  describe "#global" do
    it "returns the global object for current context" do
      subject.global.should be_kind_of(Mustang::V8::Object)
    end
  end

  describe "#enter" do
    subject { Mustang::V8::Context.new }

    context "when block given" do
      it "enters to context evaluates passed block, and exits after execution" do
        entered = false
        subject.exit
        subject.enter { |cxt| entered = cxt.entered? }
        entered.should be_true
        subject.should_not be_entered
      end
    end

    context "when no block given" do
      it "enters to context" do
        subject.exit
        subject.enter.should be
        subject.should be_entered
      end
    end
  end

  describe "#exit" do
    it "exits from context" do
      subject.exit.should_not be
      subject.should_not be_entered
    end
  end

  describe ".exit_all!" do
    it "exits from all curretnly entered contexts" do
      cxts = []
      cxts << Mustang::V8::Context.new
      cxts << Mustang::V8::Context.new
      cxts << Mustang::V8::Context.new
      cxts.each { |cxt| cxt.enter }
      Mustang::V8::Context.exit_all!
      cxts.each { |cxt| cxt.should_not be_entered }
    end
  end

  describe ".current" do
    context "when there is entered context" do
      it "returns currently entered context" do
        pending "not implemented"
        cxt = Mustang::V8::Context.new
        cxt.enter
        Mustang::V8::Context.current.should == cxt
      end
    end

    context "when there is no context entered" do
      it "returns nil" do
        pending "not implemented"
        Mustang::V8::Context.exit_all!
        Mustang::V8::Context.current.should_not be
      end
    end

    it "is aliased with #entered" do
      pending "not implemented"
      Mustang::V8::Context.new.enter
      Mustang::V8::Context.entered.should == Mustang::V8::Context.current
    end
  end
end
