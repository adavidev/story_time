require "story_time/version"
require "engtagger"
require "verbs"
require "story_time/present_finder"
require "story_time/third_person"
require "story_time/string"
require "story_time/eng_tagger_extensions"

module StoryTime
  ::String.send :include, StoryTime::String
  ::EngTagger.send :include, StoryTime::EngTaggerExtensions
end
