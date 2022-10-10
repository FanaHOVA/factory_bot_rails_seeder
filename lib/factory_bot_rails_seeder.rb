# frozen_string_literal: true

require_relative "factory_bot_rails_seeder/version"

module FactoryBotRailsSeeder
  class Error < StandardError; end
  
  def self.generate_for_all_classes
    Rails.application.eager_load!

    ApplicationRecord.descendants.each do |klass|
      generate_factory_for_active_record_class(klass)
    end
  end

  def self.generate_only_for(classes_to_generate_for = [])
    classes_to_generate_for.each do |klass|
      generate_factory_for_active_record_class(klass)
    end
  end

  def self.generate_for_all_but(classes_to_not_generate_for = [])
    (ApplicationRecord.descendants - classes_to_not_generate_for).each do |klass|
      generate_factory_for_active_record_class(klass)
    end
  end

  def self.generate_factory_for_active_record_class(klass)
    attributes_strings = []

    klass.columns_hash.each do |column_name, info|
      next if ['created_at', 'updated_at'].include?(column_name)
      
      attributes_strings << "#{column_name}:#{info.type.to_s}"
    end

    system("rails g factory_bot:model #{klass} #{attributes_strings.join(' ')}")
  end
end
