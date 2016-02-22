module StoryTime
  module String
    module ClassMethods

    end

    module InstanceMethods
      def past_tense
        pr = PresentReplacer.new
        found = pr.find self
        pr.replace self, found
      end

      def third_person(name = "John Doe", gender = "male")
        tp = ThirdPerson.new(name, gender)
        found = tp.find self
        tp.replace self, found
      end

      def tagged
        return ::EngTagger.new.add_tags(self)
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end