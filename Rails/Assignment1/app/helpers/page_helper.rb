module PageHelper


  def calendar( month, year )
    num_days = Time.days_in_month(month, year)
    current_date = Date.new( year, month, 1 ) #1 is the day
###############################################################################################################
    prev_month = month - 1
    prev_year = year
    if(prev_month <= 0)
      prev_month = 12
      prev_year = year - 1
    end
##############################################################################################################
   next_month = month + 1
    next_year = year
    if(next_month > 12)
       next_month = 1
       next_year = year + 1
    end
    #########################################################################################################
    cal = ''


    day_of_week = current_date.strftime('%w').to_i
    cal += "<table border='1' id='wide'>\n\t<tr>\n"
    days = %w(Sun Mon Tues Wed Thur Fri Sat)
    days.each do |day|
      cal += "\t\t<td class='color'>#{day}</td>\n"
    end

    #Second row - first week of the month
    cal += "<tr>"

    day_of_week.times do
      cal += "<td>&nbsp;</td>".html_safe
    end
    ############days_in_month(month, year = now.year)#returns number of days in the given month
    #Print the days of week starting with 1
    (7 - day_of_week).times do |day|
      cal += "<td>#{day + 1}</td>"
    end
    #cal += "<br/>"
    #Loop to do the in between rows that won't have blank spaces in them
       #sub loops for weeks and days

###########################Adds a row of blanks boxes across##############################################################
    counter = 7 - day_of_week + 1
    cal += "<tr>"
    7.times do
      cal += "<td>#{ counter }</td>"
      counter += 1
    end

#######################################################################################
    cal += "</tr>"
    7.times do
      cal += "<td>#{counter}</td>"
      counter += 1
    end

#######################################################################################
    cal += "<tr>"
    7.times do
      cal += "<td>#{counter}</td>"
      counter += 1
    end

########################################################################################
    counter2 = num_days - counter + 1
    cal += "<tr>"
    if counter2 < 7
      counter2.times do
      cal += "<td>#{counter}</td>"
      counter += 1
      end
      (7 - counter).times do
        cal += "<td>&nbsp;</td>".html_safe
      end

    elsif counter2 == 7
      cal += "<tr>"
      7.times do
        cal += "<td>#{counter}</td>"
        counter += 1
      end

      cal += "<br/>"
          else
            7.times do
              cal += "<td>#{counter}</td>"
              counter += 1
            end



    end

    #cal += "<br/>"
    (7 - counter2 ).times do
      cal += "<td>&nbsp;</td>"
    end
    #Final loop to do the last row which will have blank spaces at the end


    cal += link_to 'Previous', calendar_path(:month => prev_month, :year => prev_year )
    cal += "&nbsp;&nbsp;&nbsp;"
    cal += link_to 'Next', calendar_path(:month => next_month, :year => next_year )
    #cal += "<br/>Month: "
    cal += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-" + current_date.strftime('%B')
    cal += "&nbsp;#{year}-<br/>"
    #cal += "Date: #{current_date}"
    cal += "\t</tr>\n</table>\n"
    #cal += day_of_week.to_s
    return cal
  end
end

