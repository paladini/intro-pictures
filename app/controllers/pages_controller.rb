class PagesController < ApplicationController
  def home
  	company = Company.first
  	@message = Message.new
    @jobs = Job.all
  	@email = company.email
  	@telephone = company.telephone

  	if I18n.locale == :en
  		@summary = company.summary_en
  		@address = company.address_en
  		@employees = company.employees.map {|e| {name: e.name, role: e.role_en}} 
  	elsif I18n.locale == :pt 
  		@summary = company.summary_pt
  		@address = company.address_pt
  		@employees = company.employees.map {|e| {name: e.name, role: e.role_pt}} 
  	elsif I18n.locale == :es
  		@summary = company.summary_es
  		@address = company.address_es
  		@employees = company.employees.map {|e| {name: e.name, role: e.role_es}} 
  	end
  end
end
