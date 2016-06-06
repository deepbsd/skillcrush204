#!/usr/bin/env ruby

#  This is a birthpath number app for numerology.  Your birthpath
#  number is a single digit.  Read all about it at
#  https://cafeastrology.com/numerology.html

require 'sinatra'

# move to person.rb
def get_birthpath_num(date)
    # Derives the birthpath number from the birthdate
    # add the numbers in the date string
    num = date[0].to_i + date[1].to_i + date[2].to_i + date[3].to_i + date[4].to_i + date[5].to_i + date[6].to_i + date[7].to_i

    num = num.to_s
    num = num[0].to_i + num[1].to_i

    if num > 9 then
        num = num.to_s
        num = num[0].to_i + num[1].to_i
    end

    return num
end

# Here comes the woo woo part!  The text for this comes off of
# cafeastrology.com!

# move to person.rb
def get_message(num)

    case num
    when 1
      message = "Your numerology number is #{num}.\nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
    when 2
      message = "Your numerology number is #{num}.\nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
    when 3
      message = "Your numerology number is #{num}.\nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
    when 4
      message = "Your numerology number is #{num}.\nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
    when 5
      message = "Your numerology number is #{num}.\nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
    when 6
      message = "Your numerology number is #{num}.\nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
    when 7
      message = "Your numerology number is #{num}.\nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
    when 8
      message = "Your numerology number is #{num}.\nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
    when 9
      message = "Your numerology number is #{num}.\nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
    end
end

# validate input  (moved to person.rb)
def valid_birthdate(input)
    if input.match(/^[0-9]{8}$/)
        return true
    else
        return false
    end
end

def setup_index_view
    birthdate = params[:birthdate]
    name = params[:name]
    path_num = get_birthpath_num(birthdate)
    @message = get_message(path_num)
    #"<h3>Hello #{name}!<br>#{@message}</h3>"  # Personalized display.  This one won't pass the test
    #"#{@message}"     # won't pass test...
    erb :index        # use to pass tests
end



get '/' do
    erb :form
end

post '/' do
    birthdate = params[:birthdate].gsub('-','')
    if valid_birthdate(birthdate)
        birthpath_num = get_birthpath_num(birthdate)
        redirect "/message/#{birthpath_num}"
    else
        @error = "Oops! You should enter a valid birthdate in the form of mmddyyyy. Try again!"
        erb :form
    end
end



=begin
post '/' do
    setup_index_view
end
=end

get '/message/:birth_path_num' do
    birthpath_num = params[:birth_path_num].to_i
    @message = get_message(birthpath_num)
    erb :index
end

get '/newpage' do
    @numerology = '<h4>Birth Path Number</h4>
<p>The birth path number, which suggests your overall path in life and place in the world, is based on your complete birth date. It is easy to calculate. Simply add up the digits of your birth data, and keep &#8220;reducing&#8221; (explained via the example here) to a single digit.</p>
<h3>Example:</h3>
<p style="text-align: left;">If your birthday is April 28, 1968, for example, note it as follows:</p>
<p style="text-align: left;">Birth Month is April, which is the 4th month = 4<br />
Birth Day is 28 = 28<br />
Birth Year is 1968 = 1968.</p>
<p>Add up the digits of<i> all </i>of these numbers:<br />
4+2+8+1+9+6+8 = 38</p>
<p style="text-align: left;">Further &#8220;reduce&#8221; this number to a single digit by adding its digits:<br />
3+8 = 11</p>
<p style="text-align: left;">And then further reduce it, if necessary:<br />
1+1 = <b>2</b></p>
<p style="text-align: left;">The final digit, <b>2</b>, is the Birth Path Number!</p>
<p>&nbsp;</p>
<h4>Name Number</h4>
<p>Use the birth name&#8211;the name given a person at birth&#8211;to determine the Name Number (also known as the Expression Number), which reveals the overall personality. To calculate the name number, find the number that corresponds to each letter in the name in the chart below, add the numerals up, and then &#8220;reduce&#8221; the final number to a single digit, as you did with the birth path number, above.</p>
'
    erb :newpage
end


get '/:birthdate' do
    setup_index_view
end
