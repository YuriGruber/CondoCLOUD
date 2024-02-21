const mesesPorExtenso = [
        'Janeiro', 'Fevereiro', 'Março', 'Abril',
        'Maio', 'Junho', 'Julho', 'Agosto',
        'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ];

// Função para formatar data
function DD_mesExtenso_SQL(dataSQL) {
    const [ano, mes, dia] = dataSQL.split('-');
    const mesPorExtenso = mesesPorExtenso[parseInt(mes, 10) - 1];

    return dia + ' de ' + mesPorExtenso;
}

function DD_mesExtenso_diaMes(dia, mes) {
    // Garanta que os valores estejam dentro dos limites
    dia = Math.max(1, Math.min(31, dia));
    mes = Math.max(1, Math.min(12, mes));

    const mesPorExtenso = mesesPorExtenso[mes - 1];

    return dia + ' de ' + mesPorExtenso;
}

function mesExtenso(mes){
    return mesesPorExtenso[mes - 1];
}

function primeiraLetraMaiuscula(str) {
    // Verifica se a string é não vazia
    if (str.length === 0) {
        return str;
    }

    // Transforma o primeiro caractere para maiúsculo e concatena com o restante da string
    return str.charAt(0).toUpperCase() + str.slice(1);
}
