﻿namespace ExcellenceQuest.API.Controllers
{
    using ExcellenceQuest.Repository.Constants;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using System.Threading.Tasks;
    using ExcellenceQuest.Business.Contracts;
    using ExcellenceQuest.Models.Employee;
    using ExcellenceQuest.Models.Token;

    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        #region Manage Construction Injection
        private ITokenService _tokenService;
        private IUserService _userservice;
        private IEmployeeService _employeeService;

        public TokenController(ITokenService tokenService,  IUserService userService, IEmployeeService employeeService)
        {
            _userservice = userService;
            _tokenService = tokenService;
            _employeeService = employeeService;
        }


        #endregion
        [HttpPost]
        [Route(APIConstants.GetToken)]
        public async Task<IActionResult> GetToken(TokenRequestModel request)
        {
            if (!string.IsNullOrWhiteSpace(request.UserEmail))
            {

                UserModel user = await _userservice.SearchUser(request.UserEmail, request.Password);
                EmployeeModel cmpUser = await _employeeService.GetEmployeeDetails(user.EmployeeId);
                UserRoleModel userRole = await _userservice.GetEmployeeRole(user.EmployeeId);

                if (userRole != null && cmpUser !=null && userRole!=null)
                {
                    TokenResponseModel response = new TokenResponseModel();
                    response.Employee = cmpUser;
                    response.UserRole = userRole;
                    response.User = user;
                    response.ClientName = "Microsoft";
                    var token = new TokenModel();
                    token.AccessToken = _tokenService.GenerateToken(response);

                    return Ok(token);
                }
            }
            return StatusCode(StatusCodes.Status204NoContent);

        }
    }
}