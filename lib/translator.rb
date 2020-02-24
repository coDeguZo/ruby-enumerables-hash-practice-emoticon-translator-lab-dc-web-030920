# require modules here
require 'yaml'

def load_library(file)
  emot_hashes = {'get_meaning' => {}, 'get_emoticon' => {}}
  YAML.load_file(file).each do |meaning, value|
    eng = value[0]
    jap = value[1]
    emot_hashes['get_meaning'][jap] = meaning
    emot_hashes['get_emoticon'][eng] = jap
  end
  emot_hashes
end

def get_japanese_emoticon(file, emoticon)
  source = load_library(file)
  jap = source["get_emoticon"][emoticon]
  return "Sorry, that emoticon was not found" if jap == nil
end

def get_english_meaning(file, emoticon)
  source = YAML.load_file(file)
  load_library(file)
end