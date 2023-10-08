class Student
  attr_accessor :name, :dorm, :experience, :graduated, :languages

  def initialize(builder)
    @name = builder.name
    @dorm = builder.dorm
    @experience = builder.experience
    @graduated = builder.graduated
    @languages = builder.languages
  end

  class StudentBuilder
    attr_reader :name, :dorm, :experience, :graduated, :languages
    def initialize
      @experience = 0
      @dorm = false
      @languages = []
    end

    def with_name(name)
      @name = name
      self
    end

    def dorm(dorm)
      @dorm = dorm
      self
    end

    def has_exp(experience)
      @experience = experience
      self
    end

    def graduated(univ)
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

  class StudentGenerator
    def generate
      students = []
      students << StudentBuilder.new.with_name("Alice").graduated('ped').has_exp(0).add_lang('python').dorm(true).build
      students << StudentBuilder.new.with_name("Bob").graduated('ped').has_exp(2).add_lang('java').dorm(true).build
      students << StudentBuilder.new.with_name("Carl").graduated('meh').has_exp(0).add_lang('java').dorm(false).build
      students << StudentBuilder.new.with_name("Diana").graduated('meh').has_exp(3).add_lang('cpp').dorm(false).build
      students << StudentBuilder.new.with_name("Eric").graduated('bio').has_exp(0).add_lang('python').dorm(true).build
      students << StudentBuilder.new.with_name("Fiona").graduated('ped').has_exp(2).add_lang('java').dorm(false).build
      students << StudentBuilder.new.with_name("Greg").graduated('bio').has_exp(1).add_lang('cpp').add_lang('java').dorm(true).build
      students
    end
  end
end