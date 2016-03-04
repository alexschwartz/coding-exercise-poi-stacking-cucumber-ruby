Given(/^a POI sequence (.+)$/) do |input_data|
    @input_data = Utils.literal2array(input_data)
end

When(/^the POIs are stacked$/) do
    @output = PoiStackingStrategy.new.stack(@input_data)
end

Then(/^the POI icons in the stack are equal to (.+)$/) do |expected_output_seq|
   output_literal = Utils.array2literal(@output)
   
   # cleanup the expected result ('A,B, C' -> 'A,B,C')
   expected_output_seq_cleaned = Utils.array2literal(Utils.literal2array(expected_output_seq))

      

   # and now verify
   expect(output_literal).to eq(expected_output_seq_cleaned)
end

Then(/^the number of POI icons is less than (\d+)$/) do |arg1|
end

class Utils
   def self.literal2array(input_literal)
       input_literal.split(/,\s*/)
   end

   def self.array2literal(arr)
       arr.join(',')
   end
end

class PoiStackingStrategy 

   def stack(input)
     output = []
     seq = input.sort
     if (seq.length > 3) 
         return seq.slice(0,2) << '...'
     end
     seq
   end

end
