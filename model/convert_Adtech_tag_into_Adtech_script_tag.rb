#!/usr/bin/env ruby
require 'mysql'

class DataAccess 
  attr_accessor :dbh
 
def initialize ad_ids
  @dbh = Mysql.real_connect('int18','sa','sakontera','Kona18_3_2012_7_8') # local
  @ad_ids = ad_ids
end
	
def get_adtech_thrp_tag 	  
  query = "select 
               ad_id,property_value      
           FROM 
		adc_ad_properties 
           where     
               ad_id in (#{@ad_ids})
	   and 
	       property_name='thrdp_tag';"
	       
  return   @dbh.query(query)

end

end




def create_script_tag(tag)
  tag1 = "#{tag}".gsub('rdclick=' , 'rdclick=[REDIRECT_URL]').gsub('<kona_callback>' , '') 
  tag2 = "#{tag}".gsub('addyn' ,'adlink').gsub('rdclick=<kona_callback' ,'').gsub('rdclick=','').gsub('loc=100','loc=300')
  tag3 = "#{tag}".gsub('addyn' , 'adserv').gsub('rdclick=<kona_callback','').gsub('rdclick=','').gsub('loc=100','loc=300')
  return  "'<script language='javascript1.1' src='#{tag1}'></script><noscript><a href='#{tag2}'target='_blank'><img src='#{tag3}'border='0' width='0' height='0'></a></noscript>"
end


def write_to_file(script_tag) 
  @file_to_print.write(script_tag)     #=> 10
end

            
def get_script_tag(ad_ids)
#  p @ad_ids
   con = DataAccess.new(@ad_ids)
   @file_to_print = File.new("script_list.txt", "w")  
   con.get_adtech_thrp_tag().each_hash do |tag|
     script_tag = create_script_tag(tag['property_value'])
     write_to_file(script_tag + "\n\n")
#p    tag
p    script_tag
     end
   @file_to_print.close
end



#get_script_tag()







