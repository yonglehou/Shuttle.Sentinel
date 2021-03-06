using System;
using Shuttle.Core.Infrastructure;

namespace Shuttle.Sentinel
{
	public enum AuthenticationResultType
	{
		Authenticated = 0,
		ActivationRequired = 1,
		PasswordExpired = 2,
		Failure = 3
	}

	public class AuthenticationResult
	{
		private AuthenticationResult(bool authenticated, AuthenticationResultType resultType, object authenticationTag)
		{
			Authenticated = authenticated;
			ResultType = resultType;
			AuthenticationTag = authenticationTag;
		}

		public bool Authenticated { get; private set; }
		public AuthenticationResultType ResultType { get; private set; }
		public object AuthenticationTag { get; private set; }

		public static AuthenticationResult Success()
		{
			return new AuthenticationResult(true, AuthenticationResultType.Authenticated, null);
		}

		public static AuthenticationResult Success(object authenticationTag)
		{
			return new AuthenticationResult(true, AuthenticationResultType.Authenticated, authenticationTag);
		}

		public static AuthenticationResult Failure()
		{
			return new AuthenticationResult(false, AuthenticationResultType.Failure, null);
		}

		public static AuthenticationResult Failure(AuthenticationResultType resultType)
		{
			Guard.Against<ApplicationException>(resultType == AuthenticationResultType.Authenticated, "Cannot specify 'Authenticated' as the AuthenticationResultType when authentication has failed.");

			return new AuthenticationResult(false, resultType, null);
		}
	}
}