#include <bits/stdc++.h>
using namespace std;

// �N����ഫ�� 2 ��ƪ��Q���i��r��
string intToHex(int n) {
    stringstream ss;
    ss << hex << setw(2) << setfill('0') << n; // �ର 2 ��ƪ� 16 �i��
    return ss.str();
}

int main() {
    // �w�q��ӦV�q x �M y�A�s��|�Ӯy���I�� x �M y ��
    vector<int> x(4, 0);
    vector<int> y(4, 0);

    // ��l�ƥ|�Ӯy���I
    x[0] = 2;   y[0] = 12;
    x[1] = 9;   y[1] = 12;
    x[2] = 0;   y[2] = 0;
    x[3] = 16;  y[3] = 0;

    // ����u�ʴ��ȡA�M�� y[0] �� y[2] ���϶��A�íp�����������
    for (int i = 0; i <= y[0]; i++) {
        // �p����l�Ay[2] - y[0] �Ψӱ���Ȫ��d��
        int numerator = y[2] - y[0];

        // �p�� x �b���ܤƶq
        int dL = x[2] - x[0];  // ���䪺 x �b�ܤƶq
        int dR = x[3] - x[1];  // �k�䪺 x �b�ܤƶq

        // �p�ⴡ�ȹL�{����������
        int tempL = dL * i;     // ���䪺���ȶi��p��
        int tempR = dR * i;     // �k�䪺���ȶi��p��

        // �p��C�Ӵ��Ȫ��첾
        int offsetL = tempL / numerator;
        int offsetR = tempR / numerator;

        // �ˬd�O�_���l�ơA�Y�L�l�ƫh�аO�� 1
        int noRemainderL = ((tempL % numerator == 0) ? 1 : 0);
        int noRemainderR = ((tempR % numerator == 0) ? 1 : 0);

        // �ھڱ���ץ����䪺���Ȱ����q�A�קK�X�{���~�����ȵ��G
        if (!(numerator >= 0 && dL >= 0 || numerator < 0 && dL < 0 || noRemainderL)) {
            offsetL -= 1;  // �Y�L�k�㰣�A�h�N���G�V�U�ץ�
        }

        // �ھڱ���ץ��k�䪺���Ȱ����q�A�קK�X�{���~�����ȵ��G
        if (!(numerator >= 0 && dR >= 0 || numerator < 0 && dR < 0 || noRemainderR)) {
            offsetR -= 1;  // �Y�L�k�㰣�A�h�N���G�V�U�ץ�
        }

        // ��X���ȵ��G�A�N�y���I�榡�Ƭ��Q���i��
        cout << "(" << intToHex((offsetL + x[2])) << "," << intToHex((offsetR + x[3])) << ")\n";
        cout << "\n";
    }

    return 0;
}
