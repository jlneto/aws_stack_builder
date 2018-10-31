# AwsStackBuilder

Essa gem ira criar os arquivos necessários para criar e atualizar o stack 
de seu aplicativo na AWS

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aws_stack_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aws_stack_builder

## Usage

# Instalação de Produção ou Homologação

Para instalar o aplicativo, temos 2 arquivos do Cloud Formation:

- O primeiro para montar a maquina base onde os aplicativos irão rodar, que a partir desse EC2
iremos gerar a AMI base para as maquinas de homologação e produção

- O segundo é para montar o STACK completo do aplicativo, que usa como
parametro o ID da AMI gerada pelo primeiro CF


- Entre no Cloud Formation: https://console.aws.amazon.com/cloudformation
- Clique em Create Stack e informe o CF da AMI e execute
- Como output teremos o id da maquinda criada
- Entre no EC2 e a partir dessa maquina crie uma AMI.
- Anote o AMI dessa AMI e altere o default do CF do Stack para esse novo ID


   Durante a criacao da maquina, o log é criado esta no /tmp/user_data.log
   
    tail -f /tmp/user_data.log



- Entre no Cloud Formation novamente
- Clique em Create Stack e informe o agora o segundo CF do Stack e execute
- Como output teremos o DNS de entrada no stack completo do aplicativo
- Entre no Aplicativo e faça um ciclo completo de uso para validar a instalação




# Cloud Formation (CF)

Para criar os arquivos do CF usamos as seguintes ferramentas:

### Throposhpere
https://github.com/cloudtools/troposphere

### CF Designer:
https://console.aws.amazon.com/cloudformation/designer/home?region=us-east-1

Primeiro instale o troposphere na sua maquina

    https://github.com/cloudtools/troposphere
    $ pip install troposphere


Para gerar o cloud formation, execute o arquivo aws_stack.py com o python

    python aws_stack.py
    
Responda as perguntas e no final um novo arquivo .json será criado

Voce pode abrir o Json gerado para visualizar a arquiterura do aplicativo:

WEB
WORKERS:
    calc_testv (ASJM)
    general (ASJM)
    deploy (ASJM)
    builder
SUNSPOT
RDS*
S3*
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/aws_stack_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AwsStackBuilder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/aws_stack_builder/blob/master/CODE_OF_CONDUCT.md).
