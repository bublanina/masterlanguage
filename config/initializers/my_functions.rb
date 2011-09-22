require 'date'
def days_in_month(year, month)
  (Date.new(year, 12, 31) << (12-month)).day
end


#nastavenie vlastnych casov a datumov

Time::DATE_FORMATS[:zakladny] = "%d. %m. %Y"