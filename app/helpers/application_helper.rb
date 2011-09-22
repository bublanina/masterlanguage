# -*- encoding : utf-8 -*-
module ApplicationHelper
  def den(index)  #---------vrati slovensky den za funkciou wday----------------
    @den = ["Nedeľa","Pondelok", "Utorok", "Streda", "Štvrtok", "Piatok", "Sobota"]
    return @den[index]
  end

  def den_s(index)
    @den = ["Ne","Po", "Ut", "Str", "Štv", "Pi","So"]
    return @den[index]
  end

#-------vrati nazov mesiaca
  def mesiac(index)
    @mesiac = ["Január","Február","Marec","Apríl","Máj","Jún","Júl","August","September",
               "Október","November","December"]
    return @mesiac[index-1]
  end

#---- casuje slovo rok, pouzitie - rokov(cislo)---------------------------------
  def rokov(a)
    x = case a
    when 1 then " rok"
    when 2..4 then " roky"
    else " rokov"
    end
    return a.to_s+x
  end
#--------casuje mesiac podla hodnoty, pouzitie - mesiacov(cislo)----------------
  def mesiacov(a)
    x = case a
    when 1 then " mesiac"
    when 2..4 then " mesiace"
    else " mesiacov"
    end
    return a.to_s+x
  end


end