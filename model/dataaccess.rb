#!/usr/bin/env ruby
require 'mysql'
require './ad_list.rb'



class DataAccess 
  attr_accessor :dbh
 
def initialize ad_ids
  @dbh = Mysql.real_connect('int18','sa','sakontera','Kona18_3_2012_7_8') # local
  #@dbh = Mysql.real_connect('db2','sa','sakontera','Kona18_3') # production
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