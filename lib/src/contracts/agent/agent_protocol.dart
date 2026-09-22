import 'agent_request.dart';
import 'agent_result.dart';

abstract interface class AgentProtocol {
  Future<AgentResult> run(AgentRequest request);
}
