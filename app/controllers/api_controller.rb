
class ApiController < ActionController::API

    def success!(payload = {}, code = nil)
         code ||= :ok
         render json: { status: true, payload: payload }, status: code
    end

    def fail!(errors, code = nil)
        errors = [errors] if errors.is_a? String

        code ||= :unprocessable_entity
        render json: { success: false, errors: errors }, status: code


    end

    def json_payload
        HashWithIndifferentAccess.new(JSON.parse(request.raw_post))
    end
end