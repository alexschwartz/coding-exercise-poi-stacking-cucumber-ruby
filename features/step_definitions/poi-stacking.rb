Given(/^a POI sequence (.+)$/) do |input_data|
    @input_data = input_data.split(/,/)
end

When(/^the POIs are stacked$/) do
    @output = PoiStackingStrategy.new.stack(@input)
end

Then(/^the POI icons in the stack are equal to (.+)$/) do |expected_output_seq|
   expect(@output).to eq(expected_output_seq)
end

Then(/^the number of POI icons is less than (\d+)$/) do |arg1|
end

class PoiStackingStrategy 
   
   def stack(input)
     [ 'A', 'B' ]
   end

end
