# -*- encoding : utf-8 -*-
ActiveRecord::Base.class_eval do

  #----kontroluje dlzku slov, predtym odstrani html kod z textu
  def self.validates_words_in(*attr_names)
    validates_each(attr_names) do |record, attr_name, value|  #record je Model
       if Sanitize.clean(value).split.any? {|w| w.length > 18}
          record.errors.add(:text, "nemôže obsahovať slová dlhšie ako 18 znakov")
      end
    end
  end

    def self.validates_older_time(*attr_names)
    validates_each(attr_names) do |record, attr_name, value|  #record je Model
       if value>Date.today
          record.errors.add(:dátum, "musí byť rovný alebo starší ako dnešný")
      end
    end
  end

 def self.validates_future_time(*attr_names)
    validates_each(attr_names) do |record, attr_name, value|  #record je Model
       if value<Date.today
          record.errors.add(:dátum, "musí byť dnešný alebo budúci")
      end
    end
  end


end
