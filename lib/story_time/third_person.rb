class ThirdPerson

    def initialize(name = "John Doe", gender = "male")
        @tgr = ::EngTagger.new
        @name = name
        @gender = gender
        @eyes = 0
    end

    def find(str)
        tagged = @tgr.add_tags(str)

        pronouns = @tgr.get_pronouns(tagged).keys

        {}.tap do |hs|
            pronouns.each do |pronoun|
                hs[pronoun] = pronoun_conversion(pronoun)
            end
        end
    end

    def replace(text, replacements = {})
        replaced = text.dup

        replacements.keys.each do |rep|
          if rep == "I"
            replaced.gsub!(rep) do |val|
              @eyes += 1
              if @eyes > 1
                gender_pronouns["I"]
              else
                replacements[rep]
              end
            end
          else
            replaced.gsub!(rep, replacements[rep])
          end
        end

        replaced
    end

    def gender_pronouns()
      {
        "male" =>
        {
          "my" => "his",
          "me" => "him",
          "I" => "he"
        },
        "female" =>
        {
          "my" => "her",
          "me" => "her",
          "I" => "she"
        }
      }[@gender]
    end

    def pronoun_conversion(pronoun)
      {
        "I" => @name,
        "my" => gender_pronouns["my"],
        "me" => gender_pronouns["me"]
      }[pronoun] || pronoun
    end
end