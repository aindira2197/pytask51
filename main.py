import pandas as pd
from pandas import ExcelWriter
from openpyxl import load_workbook
import matplotlib.pyplot as plt

class ExcelAnalyzer:
    def __init__(self, file_path):
        self.file_path = file_path
        self.data = pd.read_excel(file_path)

    def analyze_data(self):
        print(self.data.head())
        print(self.data.info())
        print(self.data.describe())

    def create_writer(self):
        with ExcelWriter('output.xlsx', engine='openpyxl') as writer:
            self.data.to_excel(writer, 'Sheet1', index=False)
            writer.book = load_workbook('output.xlsx')
            writer.close()

    def plot_data(self):
        plt.figure(figsize=(10, 6))
        plt.plot(self.data.iloc[:, 0], self.data.iloc[:, 1])
        plt.xlabel(self.data.columns[0])
        plt.ylabel(self.data.columns[1])
        plt.title('Data Plot')
        plt.show()

    def save_to_excel(self):
        self.data.to_excel('output.xlsx', index=False)

def main():
    file_path = 'input.xlsx'
    analyzer = ExcelAnalyzer(file_path)
    analyzer.analyze_data()
    analyzer.create_writer()
    analyzer.plot_data()
    analyzer.save_to_excel()

if __name__ == '__main__':
    main()

class DataProcessor:
    def __init__(self, data):
        self.data = data

    def process_data(self):
        self.data['new_column'] = self.data.iloc[:, 0] * 2
        return self.data

class DataValidator:
    def __init__(self, data):
        self.data = data

    def validate_data(self):
        if self.data.empty:
            print("Data is empty")
        else:
            print("Data is not empty")

def process_and_validate(file_path):
    data = pd.read_excel(file_path)
    processor = DataProcessor(data)
    processed_data = processor.process_data()
    validator = DataValidator(processed_data)
    validator.validate_data()

if __name__ == '__main__':
    process_and_validate('input.xlsx')