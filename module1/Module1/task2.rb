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
    "Customer\n
       ID: #{id}\n" \
      "Name: #{name} #{father} #{surname}\n" \
      "Birthdate: #{birthdate}\n" \
      "Address: #{address}\n" \
      "Credit Card: #{credit_card}\n" \
      "Account Number: #{account_number}\n"
  end



  def set_tun

  end

  def get_tun

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
                          .credit(1234).acc_id(5000)
      customers << Builder.new.w_id(0).with_name("Askold Rivery Vasilich").w_address("B street")
                          .credit(2345).acc_id(5001)
      customers << Builder.new.w_id(0).with_name("Browry Seledy Pavlovich").w_address("A street")
                          .credit(9999).acc_id(5002)
      customers << Builder.new.w_id(0).with_name("Cilestia Miss Adamovna").w_address("D street")
                          .credit(1111).acc_id(5003)
      customers << Builder.new.w_id(0).with_name("Dina Mode Viktorovna").w_address("E street")
                          .credit(1212).acc_id(5003)
      customers
    end
  end


end
class Service

end


