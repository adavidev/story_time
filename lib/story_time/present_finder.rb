class PresentReplacer

    def initialize()
        @tgr = ::EngTagger.new
    end

    def find(str)
        tagged = @tgr.add_tags(str)
        present_verbs = @tgr.get_present_verbs(tagged).keys
        infinitive_verbs = @tgr.get_infinitive_verbs(tagged).keys
        base_present_verbs = @tgr.get_base_present_verbs(tagged).keys
        {}.tap do |hs|
            present_verbs.each do |verb|
                hs[verb] = verb.verb.conjugate tense: :past, aspect: :perfective, mood: :subjunctive
            end
            base_present_verbs.each do |verb|
                hs[verb] = verb.verb.conjugate tense: :past, aspect: :perfective, mood: :subjunctive
            end
            infinitive_verbs.each do |verb|
                hs[verb] = verb.verb.conjugate tense: :past, aspect: :perfective, mood: :subjunctive
            end
        end
    end

    def replace(text, replacements = {})
        replaced = text.dup

        replacements.keys.each do |rep|
            replaced.gsub!(rep, replacements[rep])
        end

        replaced
    end
end