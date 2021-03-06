using System;
using System.Data;
using Shuttle.Core.Data;
using Shuttle.Core.Infrastructure;

namespace Shuttle.Sentinel
{
	public class SessionRepository : ISessionRepository
	{
		private readonly IDatabaseGateway _databaseGateway;
		private readonly ISessionQueryFactory _queryFactory;
		private readonly IDataRepository<Session> _dataRepository;

		public SessionRepository(IDatabaseGateway databaseGateway, IDataRepository<Session> dataRepository, ISessionQueryFactory queryFactory)
		{
			Guard.AgainstNull(databaseGateway, "databaseGateway");
			Guard.AgainstNull(dataRepository, "dataRepository");
			Guard.AgainstNull(queryFactory, "queryFactory");

			_databaseGateway = databaseGateway;
			_dataRepository = dataRepository;
			_queryFactory = queryFactory;
		}

		public void Save(Session session)
		{
			Guard.AgainstNull(session, "session");

			_databaseGateway.ExecuteUsing(_queryFactory.Remove(session.EMail));
			_databaseGateway.ExecuteUsing(_queryFactory.Add(session));

			foreach (var permission in session.Permissions)
			{
				_databaseGateway.ExecuteUsing(_queryFactory.AddPermission(session.Token, permission));
			}
		}

		public Session Get(Guid token)
		{
			var session = _dataRepository.FetchItemUsing(_queryFactory.Get(token));

			foreach (var row in _databaseGateway.GetRowsUsing(_queryFactory.GetPermissions(token)))
			{
				session.AddPermission(SessionPermissionColumns.Permission.MapFrom(row));
			}

			return session;
		}

		public void Remove(Guid token)
		{
			_databaseGateway.ExecuteUsing(_queryFactory.Remove(token));
		}
	}
}