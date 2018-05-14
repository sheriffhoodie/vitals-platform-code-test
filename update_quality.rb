require 'award'

def update_quality(awards)

  awards.each do |award|
    if award.name == 'Blue Distinction Plus'
      next
    elsif award.name == 'Blue First'
      update_Blue_First_quality(award)
    elsif award.name == 'Blue Compare'
      update_Blue_Compare_quality(award)
    elsif award.name == 'Blue Star'
      update_Blue_Star_quality(award)
    else
      update_normal_quality(award)
    end
  end

end

def update_normal_quality(award)
  if award.quality >= 1 && award.expires_in > 0
    award.quality -= 1
  elsif award.quality >= 2 && award.expires_in < 0
    award.quality -= 2
  elsif award.quality >= 2 && award.expires_in == 0
    award.quality -= 2
  elsif award.quality == 1 && award.expires_in < 0
    award.quality -= 1
  end
  award.expires_in -= 1
end

def update_Blue_Star_quality(award)
  if award.quality >= 2 && award.expires_in > 0
    award.quality -= 2
  elsif award.quality == 1 && award.expires_in > 0
    award.quality -= 1
  end
  if award.quality >= 4 && award.expires_in <= 0
    award.quality -= 4
  end
  award.expires_in -= 1
end

def update_Blue_First_quality(award)
  if award.quality < 50 && award.quality + 1 <= 50
    award.quality += 1
  end
  if award.expires_in <= 0 && award.quality + 1 <= 50
    award.quality += 1
  end

  award.expires_in -= 1
end

def update_Blue_Compare_quality(award)

  if award.expires_in >= 6 && award.expires_in < 11

    if award.quality < 50 && award.quality + 2 <= 50
      award.quality += 2
    elsif award.quality < 50 && award.quality + 1 <= 50
      award.quality += 1
    end

  elsif award.expires_in < 6 && award.expires_in > 0

    if award.quality < 50 && award.quality + 3 <= 50
      award.quality += 3
    elsif award.quality < 50 && award.quality + 2 <= 50
      award.quality += 2
    elsif award.quality < 50 && award.quality + 1 <= 50
      award.quality += 1
    end

  elsif award.expires_in <= 0
    award.quality = 0
  else
    award.quality += 1
  end

  award.expires_in -= 1
end
