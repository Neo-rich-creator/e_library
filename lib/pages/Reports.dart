import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportsAnalyticsPage extends StatefulWidget {
  const ReportsAnalyticsPage({super.key});

  @override
  _ReportsAnalyticsPageState createState() => _ReportsAnalyticsPageState();
}

class _ReportsAnalyticsPageState extends State<ReportsAnalyticsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this); // Updated for 6 tabs
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports & Analytics'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Books Borrowed'),
            Tab(text: 'Books Returned'),
            Tab(text: 'High Demand Books'),
            Tab(text: 'Financial Reports'),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildBooksBorrowedTab(),
          _buildBooksReturnedTab(),
          _buildHighDemandBooksTab(),
          _buildFinancialReportsTab(),

        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Library Overview', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text('Services Offered:', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.book),
            title: Text('Book Lending'),
            subtitle: Text('Borrow books from a wide collection.'),
          ),
          const ListTile(
            leading: Icon(Icons.local_library),
            title: Text('Study Spaces'),
            subtitle: Text('Reserve quiet study rooms.'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 50,
                    title: 'Books Borrowed',
                    color: Colors.blue,
                    radius: 50,
                  ),
                  PieChartSectionData(
                    value: 30,
                    title: 'Study Spaces',
                    color: Colors.green,
                    radius: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBooksBorrowedTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Books Borrowed', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: const FlTitlesData(show: true),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    spots: [
                      const FlSpot(0, 50),
                      const FlSpot(1, 100),
                      const FlSpot(2, 150),
                      const FlSpot(3, 130),
                      const FlSpot(4, 180),
                      const FlSpot(5, 160),
                      const FlSpot(6, 210),
                    ],
                    barWidth: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBooksReturnedTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Books Returned', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(
                    x: 1,
                    barRods: [BarChartRodData(toY: 80, color: Colors.green)],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [BarChartRodData(toY: 120, color: Colors.green)],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(toY: 90, color: Colors.green)],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [BarChartRodData(toY: 150, color: Colors.green)],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [BarChartRodData(toY: 130, color: Colors.green)],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighDemandBooksTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Books in High Demand', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Book ${index + 1}'),
                  subtitle: Text('Times Borrowed: ${(index + 1) * 30}'),
                  trailing: const Icon(Icons.book),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialReportsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Financial Reports', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: const FlTitlesData(show: true),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    spots: [
                      const FlSpot(0, 3000),
                      const FlSpot(1, 4000),
                      const FlSpot(2, 3500),
                      const FlSpot(3, 5000),
                      const FlSpot(4, 4500),
                      const FlSpot(5, 5500),
                      const FlSpot(6, 6000),
                    ],
                    barWidth: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

const Color chocolateColor = Color.fromARGB(255, 170, 42, 10);
