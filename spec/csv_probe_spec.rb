describe CsvProbe do
  let(:checker) { described_class.new(file_path) }

  describe '#record_class' do
    context 'when a Senec file is given' do
      Dir
        .glob('spec/data/senec/*.csv')
        .each do |file_path|
          let(:file_path) { file_path }

          it 'returns the SenecRecord class' do
            expect(checker.record_class).to eq(SenecRecord)
          end
        end
    end

    context 'when something different is given' do
      let(:file_path) { 'README.md' }

      it 'fails' do
        expect { checker.record_class }.to raise_error(
          StandardError,
          /Unknown data format in README.md/,
        )
      end
    end
  end
end
