class AwsStackBuilderGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :app_name, :type => :string
  argument :roles, :type => :array

  def create_aws_folder
    @app_name = app_name
    @roles = roles
    puts "Gerando na pasta aws todos os arquivos necessários"
    puts "para criarmos o stack na AWS para o app #{app_name}"
    puts "com os roles #{roles.join(', ')}."
    puts "Consute o arquivo aws/doc/README.md para instruções."

    copy_standard_files
    create_custom_files

    # transformo os arquivos em executáveis
    File.chmod(0755,"aws/geradores/build_templates.sh")
    File.chmod(0755,"aws/scripts/app_deploy.sh")
    File.chmod(0755,"aws/scripts/app_pack.sh")
    File.chmod(0755,"aws/scripts/app_stop_instances.sh")
    File.chmod(0755,"aws/scripts/app_update.sh")
    File.chmod(0755,"aws/scripts/run_delayed_job.sh")
    puts "Arquivos gerados."

  end

  private

  def copy_standard_files
    directory "aws/doc", "aws/doc"
    copy_file "aws/scripts/app_pack.sh"
    copy_file "aws/scripts/run_delayed_job.sh"
  end

  def create_custom_files
    # aqui geramos os arquivos com os roles baseados nos workers informados
    template "aws/geradores/ami-userdata.sh.template", "aws/geradores/ami-userdata.sh"
    template "aws/geradores/build_templates.sh.template", "aws/geradores/build_templates.sh"
    template "aws/scripts/app_deploy.sh.template", "aws/scripts/app_deploy.sh"
    template "aws/scripts/app_stop_instances_by_role.sh.template", "aws/scripts/app_stop_instances.sh"
    template "aws/scripts/app_update.sh.template", "aws/scripts/app_update.sh"
    template "aws/geradores/cf-stack-generator.py.template", "aws/geradores/cf-stack-generator.py"
    template "aws/geradores/cf-base-instance.py.template", "aws/geradores/cf-base-instance.py"
  end

end
