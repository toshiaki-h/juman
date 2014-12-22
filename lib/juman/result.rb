class Juman
  class Result
    include Enumerable
    def initialize(lines)
      @morphemes = []
      prev_morpheme = nil
      lines.each{|line|
        morpheme = Morpheme.new(line)
        if prev_morpheme && morpheme.candidate
          prev_morpheme.candidates << morpheme
        else
          @morphemes << morpheme
          prev_morpheme = morpheme
        end
      }
    end

    def each(&block)
      if block_given?
        @morphemes.each(&block)
        self
      else
        self.to_enum
      end
    end

    def [](nth)
      @morphemes[nth]
    end

    alias at []
  end
end
