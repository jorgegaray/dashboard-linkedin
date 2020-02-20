#
# Modulo para poder ejecutar Comando.call(args)
#
# @example
#   class MyCommand
#     extend CallableCommand
#   end
#
module CallableCommand

  def self.included(*)
    raise "#{name} debe ser extendido"
  end

  def call *args
    new(*args).call
  end
  end
  