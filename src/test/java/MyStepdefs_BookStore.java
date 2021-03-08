import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import static net.serenitybdd.rest.SerenityRest.rest;
import static org.junit.Assert.assertEquals;

public class MyStepdefs_BookStore {

    private static final RequestSpecification requestSpecification = rest().given();
    private static Response response;

    @Given("^La Book Store esta funcionando correctamente$")
    public void laBookStoreEstaFuncionandoCorrectamente() {
        response = requestSpecification.get("https://demoqa.com/");

        assertEquals("Correct status code returned", 200, response.getStatusCode());
    }

    @When("^Realizo un registro de usuario con los datos \"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\",\"([^\"]*)\"$")
    public void realizoUnRegistroDeUsuarioSatisfactorioConLosDatos(String nombre, String apellidos, String usuario, String password) {
        response = requestSpecification.contentType(ContentType.JSON).body("{\n" +
                "    \"userName\": \""+ usuario + "\",\n" +
                "    \"password\": \""+ password +"\"\n" +
                "}").post("https://demoqa.com/Account/v1/User");
    }

    @Then("^El \"([^\"]*)\" se da de alta correctamente$")
    public void elSeDaDeAltaCorrectamente(String usuario) {
        assertEquals("Correct status code returned", 201, response.getStatusCode());
        assertEquals("El usuario se ha generado correctamente", usuario, response.jsonPath().getString("username"));
    }

    @Then("^El \"([^\"]*)\" no se da de alta correctamente$")
    public void elNoSeDaDeAltaCorrectamente(String usuario) {
        assertEquals("Correct status code returned", 406, response.getStatusCode());
    }
}
