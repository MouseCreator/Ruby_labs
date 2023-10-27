require 'minitest/autorun'
require 'date'

class Customer
  attr_accessor :id, :surname, :name, :father, :birthdate, :address, :credit_card, :account_number

  def initialize(builder)
    @name = builder.name
    @dorm = builder.dorm
    @experience = builder.experience
    @graduated = builder.graduated
    @languages = builder.languages
  end


  class Builder
    attr_reader :id, :surname, :name, :father, :birthdate, :address, :credit_card, :account_number
    def initialize
      @id = 0
      @surname = ""
      @name = ""
      @father = ""
      @birthdate = Date.today
      @address = ""
      @credit_card = 0
      @account_number = 0
    end
    def id(id)
      @id = id
    end
    def with_name(full_name)
      words = full_name.split(" ")
      if words.length > 2
        @surname = words[0]
        @name = words[1]
        if words.length == 3
          @father = words[2]
        end
      else
        raise ArgumentError, "Expected string format 'Word1 Word2 Word3'"
      end
    end

    def is_dorm(dorm)
      @dorm = dorm
      self
    end

    def has_exp(experience)
      @experience = experience
      self
    end

    def graduated_from(univ)
      @graduated = univ
      self
    end

    def need_dorm
      @dorm = true
      self
    end
    def not_dorm
      @dorm = false
      self
    end

    def w_lang(languages)
      @languages = languages
      self
    end
    def add_lang(language)
      @languages << language
      self
    end

    def build
      Student.new(self)
    end
  end

  class Generator
    def generate
      students = []
      students << StudentBuilder.new.with_name("Alice").graduated_from('ped')
                                .has_exp(0).add_lang('python')
                                .is_dorm(true).build
      students << StudentBuilder.new.with_name("Bob").graduated_from('ped')
                                .has_exp(2).add_lang('java').is_dorm(true).build
      students << StudentBuilder.new.with_name("Carl").graduated_from('meh')
                                .has_exp(0).add_lang('java').is_dorm(false).build
      students << StudentBuilder.new.with_name("Diana").graduated_from('meh')
                                .has_exp(3).add_lang('cpp').is_dorm(false).build
      students << StudentBuilder.new.with_name("Eric").graduated_from('bio')
                                .has_exp(0).add_lang('python').is_dorm(true).build
      students << StudentBuilder.new.with_name("Fiona").graduated_from('ped')
                                .has_exp(2).add_lang('java').is_dorm(false).build
      students << StudentBuilder.new.with_name("Greg").graduated_from('bio')
                                .has_exp(1).add_lang('cpp').add_lang('java').is_dorm(true).build
      students
    end
  end


end
class Service

end


