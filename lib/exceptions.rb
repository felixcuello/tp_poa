module Exceptions
  class UserNotFound < StandardError; end
  class TokenNotFound < StandardError; end
  class SaldoInsuficiente < StandardError; end
  class ProductoNotFound < StandardError; end
  class InvalidSignature < StandardError; end
end
