require 'digest'

module Password
  #------------------------------------------------------------------------
  #  This generates a secure SHA512 hash to store in the database
  #  to have an extra level of sercurity
  #
  #  SECURITY NOTICE:
  #  For the sake of this University project I am not going to use
  #  a SALT to improve security
  #------------------------------------------------------------------------
  def self.sha512(string:)
    Digest::SHA2.new(512).hexdigest(string)
  end
end
