require 'spec_helper'

describe 'doas' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it {
        is_expected.to contain_concat('/etc/doas.conf')
          .with_owner('root')
          .with_group('wheel')
          .with_mode('0555')
      }
      it {
        is_expected.to contain_concat__fragment('doas header')
          .with_target('/etc/doas.conf')
          .with_content('# configured with puppet')
          .with_order('00')
      }
    end
  end
end
