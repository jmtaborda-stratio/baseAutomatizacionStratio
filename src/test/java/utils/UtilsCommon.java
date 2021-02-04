package utils;


import com.google.gson.Gson;
import io.restassured.mapper.ObjectMapperType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import schemas.UserFormacion;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;

import static net.serenitybdd.rest.SerenityRest.rest;
import static org.junit.Assert.assertEquals;

public class UtilsCommon {

    private static final RequestSpecification requestSpecification = rest().given();
    private static Response response;

    /**
     *
     * @param apiUrl
     * @param statusCodeExpected
     */
    public static void serviceIsUp(String apiUrl,int statusCodeExpected){

        response = requestSpecification.get(apiUrl);

        int statusCodeActual = response.getStatusCode();

        assertEquals("Correct status code returned", statusCodeExpected, statusCodeActual);

    }


    public static Response executeRequest(String methodRequest, String apiUrl){

        switch (methodRequest){
            case "GET":
                response = requestSpecification.get(apiUrl);
                break;

            case "POST":
                response = requestSpecification.post(apiUrl);
                break;

            case "PUT":
                response = requestSpecification.put(apiUrl);
                break;

            case "DELETE":
                response = requestSpecification.delete(apiUrl);
                break;

            case "PATCH":
                response = requestSpecification.patch(apiUrl);
                break;

            default:
                throw new RuntimeException("Invalid request method " + methodRequest);
        }

        return response;

    }

    /**
     *
     * @param responseFilePath
     * @throws FileNotFoundException
     */
    public static void compareUser(String responseFilePath) throws FileNotFoundException {
        Gson gson = new Gson();
        UserFormacion[] expectedUserFormacionResponse = gson.fromJson(new BufferedReader(new FileReader("src/test/resources/json/output/" + responseFilePath)),UserFormacion[].class);

        UserFormacion[] actualUserFormacionResponse = response.as(UserFormacion[].class, ObjectMapperType.GSON);

        assertAllFieldUser(expectedUserFormacionResponse, actualUserFormacionResponse);
    }


    /**
     *
     * @param expectedUserFormacionResponse
     * @param actualUserFormacionResponse
     */
    public static void assertAllFieldUser(UserFormacion[] expectedUserFormacionResponse, UserFormacion[] actualUserFormacionResponse){

        for (int i=0; i<expectedUserFormacionResponse.length; i++){
            assertEquals("User ID del registro [" + i + "] incorrecto", expectedUserFormacionResponse[i].getUserId(),
                    actualUserFormacionResponse[i].getUserId());
            assertEquals("ID del registro [" + i + "] incorrecto", expectedUserFormacionResponse[i].getId(),
                    actualUserFormacionResponse[i].getId());
            assertEquals("Tittle del registro [" + i + "] incorrecto", expectedUserFormacionResponse[i].getTitle(),
                    actualUserFormacionResponse[i].getTitle());
            assertEquals("Body del registro [" + i + "] incorrecto", expectedUserFormacionResponse[i].getBody(),
                    actualUserFormacionResponse[i].getBody());
        }

    }

}
