module StoryTime
  module EngTaggerExtensions
    module ClassMethods

    end

    module InstanceMethods

      PRP = EngTagger.get_ext('prp')
      PRPS = EngTagger.get_ext('prps')

      def get_pronouns(tagged)
        return nil unless valid_text(tagged)
        PRP
        trimmed = tagged.scan(PRP).map do |n|
          strip_tags(n)
        end
        t2 = tagged.scan(PRPS).map do |n|
          strip_tags(n)
        end

        trimmed = trimmed + t2

        ret = Hash.new(0)
        trimmed.each do |n|
          n = stem(n)
          next unless n.length < 100  # sanity check on word length
          ret[n] += 1 unless n =~ /\A\s*\z/
        end
        return ret
      end

    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end