require 'swagger_helper'

describe 'Entries API' do

  ################ --CREATE -- ################
  path '/api/entries' do
    post 'Create a entry' do
      tags 'Entries'
      consumes 'application/json'
      parameter name: :entry, in: :body, schema: {
          type: :object,
          properties:{
              plate:{ type: :string},
              date_arrival:{ type: :date},
              hour_arrival:{ type: :time},
              place:{ type: :string}
          },
          required: [ 'plate', 'date_arrival', 'hour_arrival','place' ]
      }
      response '201', 'entry created successfully' do
        run_test!
      end
    end
  end

################ --SELECT ONE -- ################
  path '/api/entries/{id}' do
    get 'Find entries by id' do
      tags 'Entries'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'id found' do
        run_test!
      end
      response '404', 'Entry not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
################ --DELETE -- ################
  path '/api/entries/{id}' do

    delete 'Delete entries' do
      tags 'Entries'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'id found' do
        run_test!
      end

      response '404', 'Entry not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

################ --UPDATE -- ################
  path '/api/entries/{id}' do
    put 'Update an entry' do
      tags 'Entries'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :entry, in: :body, schema: {
          type: :object,
          properties:{
              plate:{ type: :string},
              date_arrival:{ type: :date},
              hour_arrival:{ type: :time},
              place:{ type: :string}
          },
          required: [ 'plate', 'date_arrival', 'hour_arrival','place' ]
      }
      response '201', 'entry updated successfully' do
        run_test!
      end
    end
  end
  ############# --INDEX -- #################333
  path '/api/entries/' do
    get 'index: get all entries' do
      tags 'Entries'
      produces 'application/json'
        response '200', 'id found' do
        run_test!
      end
      response '404', 'Entry not found' do
        run_test!
      end
    end
  end

end