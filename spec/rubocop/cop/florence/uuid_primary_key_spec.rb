# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Florence::UuidPrimaryKey, :config do
  context 'when not within a migration class' do
    it 'registers no offence when create_table is not within a migration' do
      expect_no_offenses(<<~RUBY)
        create_table :table_name, id: :not_uuid
      RUBY
    end
  end

  context 'when within a migration' do
    it 'registers no offence when create_table specifies a uuid primary key' do
      expect_no_offenses(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, id: :uuid
          end
        end
      RUBY
    end

    it 'registers no offence when create_table specifies a uuid primary key, other options, and a block' do
      expect_no_offenses(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, foo: :bar, id: :uuid, baz: :qux do |t|
              t.string :column_name
            end
          end
        end
      RUBY
    end

    it 'registers an offence when create_table does not specify primary key' do
      expect_offense(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name
            ^^^^^^^^^^^^^^^^^^^^^^^^ Use uuid primary keys.
          end
        end
      RUBY

      expect_correction(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, id: :uuid
          end
        end
      RUBY
    end

    it 'registers an offence when create_table specifies a primary key other than uuid' do
      expect_offense(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, id: :not_uuid
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Use uuid primary keys.
          end
        end
      RUBY

      expect_correction(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, id: :uuid
          end
        end
      RUBY
    end

    it 'registers an offence when create_table specifies options and a block but does not specify primary key' do
      expect_offense(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, foo: :bar do |t|
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Use uuid primary keys.
              t.string :column_name
            end
          end
        end
      RUBY

      expect_correction(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, foo: :bar, id: :uuid do |t|
              t.string :column_name
            end
          end
        end
      RUBY
    end

    it 'registers an offence when create_table a primary key other than uuid, other options, and a block' do
      expect_offense(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, foo: :bar, id: :not_uuid, baz: :qux do |t|
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Use uuid primary keys.
              t.string :column_name
            end
          end
        end
      RUBY

      expect_correction(<<~RUBY)
        class MigrationName < ActiveRecord::Migration[7.1]
          def change
            create_table :table_name, foo: :bar, id: :uuid, baz: :qux do |t|
              t.string :column_name
            end
          end
        end
      RUBY
    end
  end
end
