package stepDefinitions;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import utils.UtilsCommon;

import java.io.FileNotFoundException;

public class MyStepdefs {
    @Given("^El API \"([^\"]*)\" esta en funcionamiento y el statusCode es \"([^\"]*)\"$")
    public void elAPIEstaEnFuncionamientoYElStatusCodeEs(String apiUrl, int statusCode) {
        UtilsCommon.serviceIsUp(apiUrl, statusCode);
    }

    @When("^Realizo una peticion \"([^\"]*)\" sobre el API \"([^\"]*)\"$")
    public void realizoUnaPeticionSobreElAPI(String requestMethod, String apiUrl) {
        UtilsCommon.executeRequest(requestMethod, apiUrl);
    }

    @Then("^La respuesta coincide con la \"([^\"]*)\" esperada$")
    public void laRespuestaCoincideConLaEsperada(String fileResponsePath) throws FileNotFoundException {
        UtilsCommon.compareUser(fileResponsePath);
    }
}
