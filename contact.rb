class Contact

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1 # this way the next contact will get a different id
  end
  
  @@contacts = []
  @@id = 1

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  # This method should call the initializer, 
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    p @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(contact,att,value)
    case
    when att=="first_name"
      contact.first_name=value 
    when att=="last_name"
      contact.last_name=value
    when att=="email"
      contact.email=value
    when att=="note"
      contact.note=value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(att,value)
    @@contacts.each do |contact|
      case
      when att=="first_name"
        if contact.first_name==value 
          return contact
        end
      when att=="last_name"
        if contact.last_name==value 
          return contact
        end
      when att=="email"
        if contact.email==value 
          return contact
        end
      when att=="note"
        if contact.note==value 
          return contact
        end
      end
    end
    return nil
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts=[]
  end

  def full_name
    return "#{@first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(contact)
    @@contacts.delete(contact)
  end

  # Feel free to add other methods here, if you need them.

end
