require 'minitest/autorun'
require 'date'

class Customer
  attr_accessor :id, :surname, :name, :father, :birthdate, :address, :credit_card, :account_number

  def initialize(builder)
    @id = builder.id
    @surname = builder.surname
    @name = builder.name
    @father = builder.father
    @birthdate = builder.birthdate
    @address = builder.address
    @credit_card = builder.credit_card
    @account_number = builder.account_number
  end

  def to_s
    "Customer\n" \
      "\tID: #{id}\n" \
      "\tName: #{full_name}\n" \
      "\tBirthdate: #{birthdate}\n" \
      "\tAddress: #{address}\n" \
      "\tCredit Card: #{credit_card}\n" \
      "\tAccount Number: #{account_number}\n"
  end

  def full_name
    "#{name} #{surname} #{father}"
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
    def get
      Customer.new(self)
    end
    def w_id(id)
      @id = id
      self
    end

    def with_name(full_name)
      words = full_name.split(" ")
      if words.length > 1 and words.length < 4
        @name = words[0]
        @surname = words[1]
        if words.length == 3
          @father = words[2]
        end
      else
        raise ArgumentError, "Expected string format 'Word1 Word2 Word3'"
      end
      self
    end
    def today
      @birthdate = Date.today
      self
    end
    def w_address(addr)
      @address = addr
      self
    end
    def credit(card)
      @credit_card = card
      self
    end

    def acc_id(bank_id)
      @account_number = bank_id
      self
    end
  end
  class Generator
    def generate
      customers = []
      customers << Builder.new.w_id(0).with_name("Athella Leyla Petrova").w_address("A street")
                          .credit(1234).acc_id(5000).get
      customers << Builder.new.w_id(1).with_name("Askold Rivery Vasilich").w_address("B street")
                          .credit(2345).acc_id(5001).get
      customers << Builder.new.w_id(2).with_name("Browry Seledy Pavlovich").w_address("A street")
                          .credit(9999).acc_id(5002).get
      customers << Builder.new.w_id(3).with_name("Cilestia Miss Adamovna").w_address("D street")
                          .credit(1111).acc_id(5003).get
      customers << Builder.new.w_id(4).with_name("Cita Mode Viktorovna").w_address("E street")
                          .credit(1212).acc_id(5003).get
      customers
    end
  end


end
class Service
  def sort_name(customers)
    res.sort_by { |customer| customer.full_name }
  end

  def filter_by_name_card_range(customers, first_letter, cardmin, cardmax)
    first_letter = first_letter.upcase
    customers.select do |customer|
      customer.name.start_with?(first_letter) and customer.credit_card > cardmin && customer.credit_card < cardmax
    end
  end
end

class CustomerServiceTest < MiniTest::Test
  def test_sort
    customers = Customer::Generator.new.generate
    exp_len = customers.length
    service = Service.new
    customers = service.sort_name(customers)
    assert_equal(exp_len, customers.length)
    (0...exp_len-1).each do |i|
      assert(customers[i].full_name < customers[i+1].full_name, "Not alphabetical order: #{customers[i].full_name}, #{customers[i+1].full_name}")
    end
  end

  def test_select
    customers = Customer::Generator.new.generate
    service = Service.new
    customers = service.sort_name(customers)
    ids = service.filter_by_name_card_range(customers, 'A', 1000, 2000).map { |customer| customer.id }
    assert_equal(ids, [0])
  end
end

