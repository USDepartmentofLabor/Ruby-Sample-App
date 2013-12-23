#import the GOVDataSDK file into your sample project.
require './GOVDataSDK'

#Create a new object and call the extend data set.

API_HOST = 'http://api.dol.gov'
API_KEY = ''
API_SECRET = ''
API_DATA = ''
API_URI = 'V1'

context = GOV::DataContext.new API_HOST, API_KEY, API_SECRET, API_DATA, API_URI
request = GOV::DataRequest.new context

############ CALL 1: This is the an example using DOL's API and the Agencies Dataset: http://developer.dol.gov/dataset/dol-agency-dataset
############ To use other datasets, substitute in the appropriate dataset location and table name.
############ EX: request.call_api 'DatasetLocation/TableName'
request.call_api 'DOLAgency/Agencies', :select => 'Agency,AgencyFullName', :orderby => 'AgencyFullName' do |results, error|
  if error
   puts error
  else
  print "\nattempting to print the results\n"
	#if the JSON is parsed
    results.each do |n|
      puts "#{n['Agency']} - #{n['AgencyFullName']}"
    end
    #end if the JSON is parsed
    
    #if the JSON is not parsed
    print results
    #end if the JSON is not parsed
  end
end

######### CALL 2# This calls the Derpartment of Labor data set callL: Make API call for Summer Jobs####################

#Make API call
#request.call_api 'SummerJobs/getJobsListing', :format => '\'json\'', :query => '\'farm\'', 
#           :region => '', :locality => '', 
#           :skipcount => '1' do |results, error|
            
#  if error
#    puts error
#  else
  
#    Jobs = results['getJobsListing']
#    JobsListing = Jobs['items']
#     results
#    JobsListing.each do |n|
#      puts "#{n['title']} - #{n['snippet']}"
#    end
    
#  end
#end

request.wait_until_finished
