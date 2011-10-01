# -*- encoding : utf-8 -*-
# Autogenerated from a Treetop grammar. Edits may be lost.


module Mail
  module ContentType
    include Treetop::Runtime

    def root
      @root ||= :content_type
    end

    include RFC2822

    include RFC2045

    module ContentType0
      def CFWS1
        elements[0]
      end

      def parameter
        elements[2]
      end

      def CFWS2
        elements[3]
      end
    end

    module ContentType1
      def main_type
        elements[0]
      end

      def sub_type
        elements[2]
      end

      def param_hashes
        elements[3]
      end
    end

    module ContentType2
      def parameters
        param_hashes.elements.map do |param|
          param.parameter.param_hash
        end
      end
    end

    def _nt_content_type
      start_index = index
      if node_cache[:content_type].has_key?(index)
        cached = node_cache[:content_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_main_type
      s0 << r1
      if r1
        if has_terminal?("/", false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("/")
          r2 = nil
        end
        s0 << r2
        if r2
          r3 = _nt_sub_type
          s0 << r3
          if r3
            s4, i4 = [], index
            loop do
              i5, s5 = index, []
              r6 = _nt_CFWS
              s5 << r6
              if r6
                if has_terminal?(";", false, index)
                  r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure(";")
                  r8 = nil
                end
                if r8
                  r7 = r8
                else
                  r7 = instantiate_node(SyntaxNode,input, index...index)
                end
                s5 << r7
                if r7
                  r9 = _nt_parameter
                  s5 << r9
                  if r9
                    r10 = _nt_CFWS
                    s5 << r10
                  end
                end
              end
              if s5.last
                r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
                r5.extend(ContentType0)
              else
                @index = i5
                r5 = nil
              end
              if r5
                s4 << r5
              else
                break
              end
            end
            r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
            s0 << r4
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(ContentType1)
        r0.extend(ContentType2)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:content_type][start_index] = r0

      r0
    end

    def _nt_main_type
      start_index = index
      if node_cache[:main_type].has_key?(index)
        cached = node_cache[:main_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_discrete_type
      if r1
        r0 = r1
      else
        r2 = _nt_composite_type
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:main_type][start_index] = r0

      r0
    end

    module DiscreteType0
    end

    module DiscreteType1
    end

    module DiscreteType2
    end

    module DiscreteType3
    end

    module DiscreteType4
    end

    def _nt_discrete_type
      start_index = index
      if node_cache[:discrete_type].has_key?(index)
        cached = node_cache[:discrete_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      i1, s1 = index, []
      if has_terminal?('\G[tT]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      s1 << r2
      if r2
        if has_terminal?('\G[eE]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        s1 << r3
        if r3
          if has_terminal?('\G[xX]', true, index)
            r4 = true
            @index += 1
          else
            r4 = nil
          end
          s1 << r4
          if r4
            if has_terminal?('\G[tT]', true, index)
              r5 = true
              @index += 1
            else
              r5 = nil
            end
            s1 << r5
          end
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(DiscreteType0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        r0 = r1
      else
        i6, s6 = index, []
        if has_terminal?('\G[iI]', true, index)
          r7 = true
          @index += 1
        else
          r7 = nil
        end
        s6 << r7
        if r7
          if has_terminal?('\G[mM]', true, index)
            r8 = true
            @index += 1
          else
            r8 = nil
          end
          s6 << r8
          if r8
            if has_terminal?('\G[aA]', true, index)
              r9 = true
              @index += 1
            else
              r9 = nil
            end
            s6 << r9
            if r9
              if has_terminal?('\G[gG]', true, index)
                r10 = true
                @index += 1
              else
                r10 = nil
              end
              s6 << r10
              if r10
                if has_terminal?('\G[eE]', true, index)
                  r11 = true
                  @index += 1
                else
                  r11 = nil
                end
                s6 << r11
              end
            end
          end
        end
        if s6.last
          r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          r6.extend(DiscreteType1)
        else
          @index = i6
          r6 = nil
        end
        if r6
          r0 = r6
        else
          i12, s12 = index, []
          if has_terminal?('\G[aA]', true, index)
            r13 = true
            @index += 1
          else
            r13 = nil
          end
          s12 << r13
          if r13
            if has_terminal?('\G[uU]', true, index)
              r14 = true
              @index += 1
            else
              r14 = nil
            end
            s12 << r14
            if r14
              if has_terminal?('\G[dD]', true, index)
                r15 = true
                @index += 1
              else
                r15 = nil
              end
              s12 << r15
              if r15
                if has_terminal?('\G[iI]', true, index)
                  r16 = true
                  @index += 1
                else
                  r16 = nil
                end
                s12 << r16
                if r16
                  if has_terminal?('\G[oO]', true, index)
                    r17 = true
                    @index += 1
                  else
                    r17 = nil
                  end
                  s12 << r17
                end
              end
            end
          end
          if s12.last
            r12 = instantiate_node(SyntaxNode,input, i12...index, s12)
            r12.extend(DiscreteType2)
          else
            @index = i12
            r12 = nil
          end
          if r12
            r0 = r12
          else
            i18, s18 = index, []
            if has_terminal?('\G[vV]', true, index)
              r19 = true
              @index += 1
            else
              r19 = nil
            end
            s18 << r19
            if r19
              if has_terminal?('\G[iI]', true, index)
                r20 = true
                @index += 1
              else
                r20 = nil
              end
              s18 << r20
              if r20
                if has_terminal?('\G[dD]', true, index)
                  r21 = true
                  @index += 1
                else
                  r21 = nil
                end
                s18 << r21
                if r21
                  if has_terminal?('\G[eE]', true, index)
                    r22 = true
                    @index += 1
                  else
                    r22 = nil
                  end
                  s18 << r22
                  if r22
                    if has_terminal?('\G[oO]', true, index)
                      r23 = true
                      @index += 1
                    else
                      r23 = nil
                    end
                    s18 << r23
                  end
                end
              end
            end
            if s18.last
              r18 = instantiate_node(SyntaxNode,input, i18...index, s18)
              r18.extend(DiscreteType3)
            else
              @index = i18
              r18 = nil
            end
            if r18
              r0 = r18
            else
              i24, s24 = index, []
              if has_terminal?('\G[aA]', true, index)
                r25 = true
                @index += 1
              else
                r25 = nil
              end
              s24 << r25
              if r25
                if has_terminal?('\G[pP]', true, index)
                  r26 = true
                  @index += 1
                else
                  r26 = nil
                end
                s24 << r26
                if r26
                  if has_terminal?('\G[pP]', true, index)
                    r27 = true
                    @index += 1
                  else
                    r27 = nil
                  end
                  s24 << r27
                  if r27
                    if has_terminal?('\G[lL]', true, index)
                      r28 = true
                      @index += 1
                    else
                      r28 = nil
                    end
                    s24 << r28
                    if r28
                      if has_terminal?('\G[iI]', true, index)
                        r29 = true
                        @index += 1
                      else
                        r29 = nil
                      end
                      s24 << r29
                      if r29
                        if has_terminal?('\G[cC]', true, index)
                          r30 = true
                          @index += 1
                        else
                          r30 = nil
                        end
                        s24 << r30
                        if r30
                          if has_terminal?('\G[aA]', true, index)
                            r31 = true
                            @index += 1
                          else
                            r31 = nil
                          end
                          s24 << r31
                          if r31
                            if has_terminal?('\G[tT]', true, index)
                              r32 = true
                              @index += 1
                            else
                              r32 = nil
                            end
                            s24 << r32
                            if r32
                              if has_terminal?('\G[iI]', true, index)
                                r33 = true
                                @index += 1
                              else
                                r33 = nil
                              end
                              s24 << r33
                              if r33
                                if has_terminal?('\G[oO]', true, index)
                                  r34 = true
                                  @index += 1
                                else
                                  r34 = nil
                                end
                                s24 << r34
                                if r34
                                  if has_terminal?('\G[nN]', true, index)
                                    r35 = true
                                    @index += 1
                                  else
                                    r35 = nil
                                  end
                                  s24 << r35
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              if s24.last
                r24 = instantiate_node(SyntaxNode,input, i24...index, s24)
                r24.extend(DiscreteType4)
              else
                @index = i24
                r24 = nil
              end
              if r24
                r0 = r24
              else
                r36 = _nt_extension_token
                if r36
                  r0 = r36
                else
                  @index = i0
                  r0 = nil
                end
              end
            end
          end
        end
      end

      node_cache[:discrete_type][start_index] = r0

      r0
    end

    module CompositeType0
    end

    module CompositeType1
    end

    def _nt_composite_type
      start_index = index
      if node_cache[:composite_type].has_key?(index)
        cached = node_cache[:composite_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      i1, s1 = index, []
      if has_terminal?('\G[mM]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      s1 << r2
      if r2
        if has_terminal?('\G[eE]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        s1 << r3
        if r3
          if has_terminal?('\G[sS]', true, index)
            r4 = true
            @index += 1
          else
            r4 = nil
          end
          s1 << r4
          if r4
            if has_terminal?('\G[sS]', true, index)
              r5 = true
              @index += 1
            else
              r5 = nil
            end
            s1 << r5
            if r5
              if has_terminal?('\G[aA]', true, index)
                r6 = true
                @index += 1
              else
                r6 = nil
              end
              s1 << r6
              if r6
                if has_terminal?('\G[gG]', true, index)
                  r7 = true
                  @index += 1
                else
                  r7 = nil
                end
                s1 << r7
                if r7
                  if has_terminal?('\G[eE]', true, index)
                    r8 = true
                    @index += 1
                  else
                    r8 = nil
                  end
                  s1 << r8
                end
              end
            end
          end
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(CompositeType0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        r0 = r1
      else
        i9, s9 = index, []
        if has_terminal?('\G[mM]', true, index)
          r10 = true
          @index += 1
        else
          r10 = nil
        end
        s9 << r10
        if r10
          if has_terminal?('\G[uU]', true, index)
            r11 = true
            @index += 1
          else
            r11 = nil
          end
          s9 << r11
          if r11
            if has_terminal?('\G[lL]', true, index)
              r12 = true
              @index += 1
            else
              r12 = nil
            end
            s9 << r12
            if r12
              if has_terminal?('\G[tT]', true, index)
                r13 = true
                @index += 1
              else
                r13 = nil
              end
              s9 << r13
              if r13
                if has_terminal?('\G[iI]', true, index)
                  r14 = true
                  @index += 1
                else
                  r14 = nil
                end
                s9 << r14
                if r14
                  if has_terminal?('\G[pP]', true, index)
                    r15 = true
                    @index += 1
                  else
                    r15 = nil
                  end
                  s9 << r15
                  if r15
                    if has_terminal?('\G[aA]', true, index)
                      r16 = true
                      @index += 1
                    else
                      r16 = nil
                    end
                    s9 << r16
                    if r16
                      if has_terminal?('\G[rR]', true, index)
                        r17 = true
                        @index += 1
                      else
                        r17 = nil
                      end
                      s9 << r17
                      if r17
                        if has_terminal?('\G[tT]', true, index)
                          r18 = true
                          @index += 1
                        else
                          r18 = nil
                        end
                        s9 << r18
                      end
                    end
                  end
                end
              end
            end
          end
        end
        if s9.last
          r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
          r9.extend(CompositeType1)
        else
          @index = i9
          r9 = nil
        end
        if r9
          r0 = r9
        else
          r19 = _nt_extension_token
          if r19
            r0 = r19
          else
            @index = i0
            r0 = nil
          end
        end
      end

      node_cache[:composite_type][start_index] = r0

      r0
    end

    def _nt_extension_token
      start_index = index
      if node_cache[:extension_token].has_key?(index)
        cached = node_cache[:extension_token][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_ietf_token
      if r1
        r0 = r1
      else
        r2 = _nt_custom_x_token
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:extension_token][start_index] = r0

      r0
    end

    def _nt_sub_type
      start_index = index
      if node_cache[:sub_type].has_key?(index)
        cached = node_cache[:sub_type][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_extension_token
      if r1
        r0 = r1
      else
        r2 = _nt_iana_token
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:sub_type][start_index] = r0

      r0
    end

    module Parameter0
      def attr
        elements[1]
      end

      def val
        elements[3]
      end

    end

    module Parameter1
      def param_hash
        {attr.text_value => val.text_value}
      end
    end

    def _nt_parameter
      start_index = index
      if node_cache[:parameter].has_key?(index)
        cached = node_cache[:parameter][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r2 = _nt_CFWS
      if r2
        r1 = r2
      else
        r1 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r1
      if r1
        r3 = _nt_attribute
        s0 << r3
        if r3
          if has_terminal?("=", false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("=")
            r4 = nil
          end
          s0 << r4
          if r4
            r5 = _nt_value
            s0 << r5
            if r5
              r7 = _nt_CFWS
              if r7
                r6 = r7
              else
                r6 = instantiate_node(SyntaxNode,input, index...index)
              end
              s0 << r6
            end
          end
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Parameter0)
        r0.extend(Parameter1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:parameter][start_index] = r0

      r0
    end

    def _nt_attribute
      start_index = index
      if node_cache[:attribute].has_key?(index)
        cached = node_cache[:attribute][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        r1 = _nt_token
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      end

      node_cache[:attribute][start_index] = r0

      r0
    end

    module Value0
      def text_value
        quoted_content.text_value
      end
    end

    def _nt_value
      start_index = index
      if node_cache[:value].has_key?(index)
        cached = node_cache[:value][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_quoted_string
      r1.extend(Value0)
      if r1
        r0 = r1
      else
        s2, i2 = [], index
        loop do
          i3 = index
          r4 = _nt_token
          if r4
            r3 = r4
          else
            if has_terminal?('\G[\\x3d]', true, index)
              r5 = true
              @index += 1
            else
              r5 = nil
            end
            if r5
              r3 = r5
            else
              @index = i3
              r3 = nil
            end
          end
          if r3
            s2 << r3
          else
            break
          end
        end
        if s2.empty?
          @index = i2
          r2 = nil
        else
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        end
        if r2
          r0 = r2
        else
          @index = i0
          r0 = nil
        end
      end

      node_cache[:value][start_index] = r0

      r0
    end

  end

  class ContentTypeParser < Treetop::Runtime::CompiledParser
    include ContentType
  end

end
