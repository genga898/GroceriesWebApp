using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using NuGet.Common;
using Microsoft.Build.Framework;
using Microsoft.Extensions.Logging;
using System.Web.Services.Description;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;

namespace GroceriesWebApp.Controllers
{
    public class MpesaPaymentController : Controller
    {
        private readonly HttpClient _httpClient;

        public MpesaPaymentController()
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new Uri("https://sandbox.safaricom.co.ke");
        }

        public async Task<string> GetToken()
        {
            //Set the authentication string and encode it
            var authString = "D2pIwSJ0eqk5zMI115kGut712l0MjcnZ : SZ6ABDqGp6q9sKZO";
            var encodedString = Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes(authString));
            var url = "/oauth/v1/generate?grant_type=client_credentials";


            //Send http request to the mpesa endpoint
            var responseMessage = new HttpRequestMessage(HttpMethod.Get, url);
            //Set request headers
            responseMessage.Headers.Add("Authorization", $"Basic <{encodedString}>");

            var response = await _httpClient.SendAsync(responseMessage);

            var mpesaResponse = await response.Content.ReadAsStringAsync();

            Token TokenObject = JsonConvert.DeserializeObject<Token>(mpesaResponse);

            return TokenObject.access_token;
        }

        // Class to get token
        class Token
        {
            public string access_token { get; set; }
            public string expires_in { get; set; }
        }

        // GET: MpesaPayment
        public ViewResult MpesaHome()
        {
            return View();
        }
    }
}