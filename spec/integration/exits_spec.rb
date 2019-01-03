require 'swagger_helper'

describe 'Exits API' do

  #################### --CREATE -- ##############
  path '/api/exits' do
    post 'Create a exit' do
      tags 'Exits'
      consumes 'application/json'
      parameter name: :exit, in: :body, schema: {
          type: :object,
          properties:{
              entry_id:{ type: :integer},
              date_departure:{ type: :date},
              hour_departure:{ type: :time},
              rate_id:{ type: :integer}
          },
          required: [ 'entry_id', 'date_departure', 'hour_departure','rate_id' ]
      }
      response '201', 'exit created successfully' do
        let(:exit) { { entry_id: 1, date_departure: '2018-22-12', hour_departure: '12:12:45', rate_id: 1 } }
        run_test!
      end
    end
  end

############################ -- Find by ID -- ###################
  path '/api/exits/{id}' do
    get 'Find exits by id' do
      tags 'Exits'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'id found' do
        schema type: :object,
               properties: {
                   entry_id:{ type: :integer},
                   date_departure:{ type: :date},
                   hour_departure:{ type: :time},
                   rate_id:{ type: :integer}
               },
               required: [ 'entry_id', 'date_departure', 'hour_departure','rate_id' ]
        let(:id) { Exit.create( entry_id: 1, date_departure: '2018-22-12', hour_departure: '12:12:45', rate_id: 1).id }
        run_test!
      end
      response '404', 'Exit not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  ######################### -- INDEX -- ####################3333333
  path '/api/exits/' do

    get 'index: get all exits ' do
      tags 'Exits'
      produces 'application/json'
      response '200', 'id found' do
        schema type: :object,
               properties: {
                   entry_id:{ type: :integer},
                   date_departure:{ type: :date},
                   hour_departure:{ type: :time},
                   rate_id:{ type: :integer}
               },
               required: [ 'entry_id', 'date_departure', 'hour_departure','rate_id' ]
        let(:id) { Exit.create( entry_id: 1, date_departure: '2018-22-12', hour_departure: '12:12:45', rate_id: 1).id }
        run_test!
      end
      response '404', 'Exit not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  ######################## --DELETE -- #############################3
  path '/api/exits/{id}' do
    delete 'Delete exits' do
      tags 'Exits'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      response '200', 'id found' do
        schema type: :object,
               properties: {
                   entry_id:{ type: :integer},
                   date_departure:{ type: :date},
                   hour_departure:{ type: :time},
                   rate_id:{ type: :integer}
               },
               required: [ 'entry_id', 'date_departure', 'hour_departure','rate_id' ]
        let(:id) { Exit.create( entry_id: 1, date_departure: '2018-22-12', hour_departure: '12:12:45', rate_id: 1).id }
        run_test!
      end
      response '404', 'Exit not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
################################ --UPDATE -- ############################
  path '/api/exits/{id}' do
    put 'Update a exit' do
      tags 'Exits'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :exit, in: :body, schema: {
          type: :object,
          properties:{
              entry_id:{ type: :integer},
              date_departure:{ type: :date},
              hour_departure:{ type: :time},
              rate_id:{ type: :integer}
          },
          required: [ 'entry_id', 'date_departure', 'hour_departure','rate_id' ]
      }
      response '201', 'exit updated successfully' do
        let(:exit) { { entry_id: 1, date_departure: '2018-22-12', hour_departure: '12:12:45', rate_id: 1 } }
        run_test!
      end
    end
  end



end