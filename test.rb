require 'time'

print "Check in: "
start_time = gets

print "Check out: "
end_time = gets

start_time = start_time.strip
end_time = end_time.strip


def valid_time time_check_in, time_check_out
  begin
    checkin = Time.parse(time_check_in)
    checkout = Time.parse(time_check_out)
    p "check in: #{checkin}"
    p "check out: #{checkout}"
    if checkout - checkin > 0
      return true
    else
      raise ArgumentError
    end
  rescue
    return false
  end
end

def calculate_time_OT time_check_in, time_check_out
  return "Input time valid, start < end" unless valid_time time_check_in, time_check_out

  time_check_in = Time.parse(time_check_in)
  time_check_out = Time.parse(time_check_out)
  time_begin_lunch = Time.parse("12:00")
  time_end_lunch = Time.parse("13:00")
  time_begin_dinner = Time.parse("13:00")
  time_works = (time_check_out - time_check_in)/3600
  if time_check_out < time_end_lunch || time_end_lunch < time_check_in
    if time_works > 3 && time_check_out > time_begin_dinner
      return "OT = #{time_works}, Lunch: N, Dinner: Y"
    else
      return "OT = #{time_works}, Lunch: N, Dinner: N"
    end
  else
    time_works -=1
    if time_works > 3 && time_check_out > time_begin_dinner
      return "OT = #{time_works}, Lunch: Y, Dinner: Y"
    else
      return "OT = #{time_works}, Lunch: Y, Dinner: N"
    end
  end
end

p calculate_time_OT start_time, end_time
