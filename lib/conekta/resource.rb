module Conekta
  class Resource < ConektaObject
    def self.class_name
      self.name.split('::')[-1]
    end
    def self.url()
      "/#{CGI.escape(self.class_name.downcase)}s"
    end
    def url
      if id == nil
        raise Exception.new("no id")
      end
      self.class.url + "/" + id
    end
  end
end
