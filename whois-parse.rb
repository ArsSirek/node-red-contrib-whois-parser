require 'json'
require 'whois-parser'


begin
	c = Whois::Client.new(:timeout => 10)
	record = c.lookup(ARGV[0])
	parser = record.parser
	my_hash = {
		:raw => record
	}

	begin
	 value = parser.nameservers
	 my_hash[:nameservers] = parser.nameservers;
	rescue Exception
		nil
	end

	begin
	 value = parser.disclaimer
	 my_hash[:disclaimer] = parser.disclaimer;
	rescue Exception
		nil
	end

	begin
	 value = parser.domain
	 my_hash[:domain] = parser.domain;
	rescue Exception
		nil
	end

	begin
	 value = parser.domain_id
	 my_hash[:domain_id] = parser.domain_id;
	rescue Exception
		nil
	end

	begin
	 value = parser.status
	 my_hash[:status] = parser.status;
	rescue Exception
		nil
	end

	begin
	 value = parser.registered?
	 my_hash[:registered] = parser.registered?;
	rescue Exception
		nil
	end

	begin
	 value = parser.available?
	 my_hash[:available] = parser.available?;
	rescue Exception
		nil
	end

	begin
	 value = parser.created_on
	 my_hash[:created_on] = parser.created_on;
	rescue Exception
		nil
	end

	begin
	 value = parser.updated_on
	 my_hash[:updated_on] = parser.updated_on;
	rescue Exception
		nil
	end

	begin
	 value = parser.expires_on
	 my_hash[:expires_on] = parser.expires_on;
	rescue Exception
		nil
	end

	begin
	 value = parser.registrar
	 my_hash[:registrar] = parser.registrar.to_h;
	rescue Exception
		nil
	end

	begin
	 value = parser.registrant_contacts
	 my_hash[:registrant_contacts] = parser.registrant_contacts.to_h;
	rescue Exception
		nil
	end

	begin
	 value = parser.admin_contacts
	 my_hash[:admin_contacts] = parser.admin_contacts.to_h;
	rescue Exception
		nil
	end

	begin
	 value = parser.technical_contacts
	 my_hash[:technical_contacts] = parser.technical_contacts.to_h;
	rescue Exception
		nil
	end


	puts JSON.generate(my_hash)

rescue Exception
	nil
end