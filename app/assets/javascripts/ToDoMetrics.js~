var json;			

			var ToDoMetrics = function () {
					//Fields
					var colaboradoresJsonURL = 'http://localhost:3000/colaboradors/listAll.json?callback=';
					var projetosJsonURL = 'http://localhost:3000/projetos/listAll.json?callback=';
					var tarefasPorProjetoJsonURL = 'http://localhost:3000/projetos/{0}/tarefas/listAll.json?callback=';



					//Private Methods
					var _getJson = function (url, callback) {
							$.ajax({
						      url: url,
  								async: false,
						      type: "GET",
    							crossDomain: true,
						      contentType: "application/json; charset=utf-8",
								
						  }).success(function(data) { callback(data); })
					}

					var _dateDiff = function (startDate, endDate) {
						  return startDate.getTime() - endDate.getTime();
					}

					var _quantidadeDeTarefasPorColaborador = function (colaboradorId) {
						  var projetos = _getJson(projetosJsonURL);
						  var tarefasPorProjeto = _getJson(projetosJsonURL);
						  var tarefas = [];

						  for (var i = 0; i < projetos.length; i++) {
						      var tarefasPorProjeto = _getJson(tarefasPorProjetoJsonURL.replace('{0}', projetos[i].id));

						      for (var j = 0; j < tarefasPorProjeto.length; j++) {
						          tarefas.push(tarefasPorProjeto[j]);
						      }
						  }

						  //Filtra Tarefa por Colaborador
						  var tarefasPorColaborador = [];

						  for (var i = 0; i < tarefas.length; i++) {
						      if (tarefas[i].colaborador_id == colaboradorId)
						          tarefas.push(tarefas[i]);
						  }

						  return tarefasPorColaborador.length;
					}

					var _tarefasPorColaborador = function () {						  
						  var result = [];

						  var colaboradores = _getJson(colaboradoresJsonURL, function(colaboradores){
								for (var i = 0; i < colaboradores.length; i++) {
									result[i] = {
										 colaboradorNome: colaboradores[i].nome,
										 quantidadeDeTarefas: _quantidadeDeTarefasPorColaborador(colaboradores[i].id)
									}
								}
						});

						return result;
					}

					var _tempoMedioDeConclusaoDeTarefasPorColaborador = function () {
						  var result = [];
						  var colaboradores = _getJson(colaboradoresJsonURL);

						  for (var i = 0; i < colaboradores.length; i++) {
						      result[i] = {
						          colaboradorNome: colaboradores[i].nome,
						          tempoMedio: function () {
						              var tempoMedio;
						              var tarefas = _tarefasPorColaborador(colaboradores[i].id);
						              var quantidadeTarefas = tarefas.length;

						              for (var j = 0; j < tarefas.length; j++) {
						                  tempoMedio += dateDiff(tarefas[j].created_at, tarefas[j].data_finalizacao);
						              }

						              tempoMedio = tempoMedio / quantidadeTarefas;
						              return tempoMedio;
						          }()
						      }
						  }

						  return result;
					}

					var _tempoTotalDeTarefas = function (tarefas) {
						  var tempoTotal;

						  for (var i = 0; i < tarefas; i++) {
						      tempoTotal += _dateDiff(tarefas[i].created_at.toString('dd/MM/yyyy'), tarefas[i].data_finalizacao.toString('dd/MM/yyyy'));
						  }
							));

						  return tempoTotal;
					}

					var _tempoGastoEmTarefasPorProjeto = function () {
						  var result = [];
						  var projetos = _getJson(projetosJsonURL, function(projetos) {
								for (var i = 0; i < projetos.length; i++) {
							    
										result[i] = {
								        projetoNome: projetos[i].nome
								    }

										_getJson(tarefasPorProjetoJsonURL.replace('{0}', projetos[i].id), function(data) {
												result[i].tempoTotal = _tempoTotalDeTarefas(data)
										});

								}
							})

					  return result;
					}



					return {
						  //Public Methods
						  tarefasPorColaborador: function () {
							return _tarefasPorColaborador();
						  },

						  tempoMedioDeConclusaoDeTarefasPorColaborador: function () {
						      return _tempoMedioDeConclusaoDeTarefasPorColaborador();
						  },

						  tempoGastoEmTarefasPorProjeto: function () {
						      return _tempoGastoEmTarefasPorProjeto();
						  }
					}
			};

