require 'swagger_helper'

describe 'Rates API' do
####################### --CREATE -- ##############333
  path '/api/rates' do
    post 'Create a rate' do
      tags 'Rates'
      consumes 'application/json'
      parameter name: :rate, in: :body, schema: {
          type: :object,
          properties:{
              value:{ type: :integer},
              name:{ type: :string},
              description:{ type: :text},
              date_begin:{type: :date},
              date_end:{type: :date}
          },
          required: [ 'value', 'name', 'date_begin', 'date_end']
          }
      response '201', 'rate created successfully' do
        run_test!
      end
    end
  end

########################### -- GET ONE -- ###################
path '/api/rates/{id}' do
  get 'Find rates by id' do
    tags 'Rates'
    produces 'application/json'
    parameter name: :id, :in => :path, :type => :string
    response '200', 'name found' do
      run_test!
   end
    response '404', 'rate not found' do
      run_test!
    end
  end
end
######################## --DELETE-- ##################33333
  path '/api/rates/{id}' do
    delete 'Delete rates' do
      tags 'Rates'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        run_test!
     end
      response '404', 'rate not found' do
        run_test!
      end
    end
  end


  ################ --UPDATE -- ################
  path '/api/rates/{id}' do
    put 'Update an rate' do
      tags 'Rates'
      consumes 'application/json'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :rate, in: :body, schema: {
          type: :object,
          properties:{
              value:{ type: :integer},
              name:{ type: :string},
              description:{ type: :text},
              date_begin:{type: :date},
              date_end:{type: :date}
          },
          required: [ 'value', 'name', 'date_begin', 'date_end']
      }
      response '204', 'NO CONTENT' do
        run_test!
      end
      response '201', 'rate update successfully' do
        run_test!
      end
    end
  end
  ############# --INDEX -- #################333
  path '/api/rates/' do

    get 'index: get all rates' do
      tags 'Rates'
      produces 'application/json'
      response '200', 'id found' do
        run_test!
      end
      response '404', 'Rate not found' do
        run_test!
      end
    end
  end



end