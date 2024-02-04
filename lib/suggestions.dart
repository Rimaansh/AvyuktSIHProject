import 'package:flutter/material.dart';

class Suggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Avyukt"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFFDD83AD), Color(0xFFB4D6F4)])),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white, // Light purple background for the entire page
        child: ListView(
          children: [
            Text(
              "Depression is a mood disorder that causes persistent feelings of sadness, loss of interest, and despair. It can have an impact on cognitive, emotional, behavioral, and physical functions. While sadness, negative thinking, and loneliness affect all of us at one point or another, the symptoms of clinical depression, or major depressive disorder, can be severe, unrelenting, and even frightening. Depression can make you feel like nothing will help, or that any relief will be temporary, and it can create a cycle of maladaptive thinking, feeling, and doing (or non-doing).\n",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            // Add the list of tips here
            ListTile(
              title: Text(
                "Get active!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("30 minutes of brisk physical activity daily is ideal but even 10 to 15 minutes a day can help. Depression can limit activity but try to push through it."),
            ),
            // Repeat the ListTile for each tip
            ListTile(
              title: Text(
                "Nourish your body!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Eat well-balanced meals and avoid high-sugar, high-fat, processed foods and alcohol."),
            ),
            ListTile(
              title: Text(
                "Sleep!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Too much sleep is not good for depression but getting enough sleep is essential for mind and body."),
            ),
            ListTile(
              title: Text(
                "Journal!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Write down recurring negative thoughts or feelings. Writing helps with personal expression and allows you to identify any distorted thinking and maladaptive behaviors."),
            ),
            ListTile(
              title: Text(
                "Challenge your thinking!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Are your distortions true? Or do they just feel real? Are you taking into account the evidence? Does it help to think this way?"),
            ),
            ListTile(
              title: Text(
                "Limit rumination!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Excessively rehashing thoughts, memories, or moments in time are a part of depression. Try being more aware when it happens and redirect yourself by thinking or doing something more helpful."),
            ),
            ListTile(
              title: Text(
                "Set realistic goals!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Rather than tackle a goal on a large scale, break it down so it is smaller and more manageable. Celebrate micro-successes and build on them."),
            ),
            ListTile(
              title: Text(
                "Reduce procrastination!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Try to do things a little at a time rather than avoid tasks altogether. This can promote a sense of accomplishment and self-efficacy."),
            ),
            ListTile(
              title: Text(
                "Avoid the big decisions!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Contemplating or acting on major life decisions should be avoided until your cognitive and decision-making abilities are sharper."),
            ),
            ListTile(
              title: Text(
                "Engage in healthy joyful activities!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Try to enjoy the small things like listening to a good song, reaching out to a friend, dancing in your own space, or a cup of tea."),
            ),
            ListTile(
              title: Text(
                "Stay connected!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("It may feel hard but keep friends and family close. Try to explain what you are experiencing and how they can help. Know you are not alone."),
            ),
            ListTile(
              title: Text(
                "Practice self-compassion!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Being harsh or overly critical is not helpful, give yourself some grace and kindness."),
            ),
          ],
        ),
      ),
    );
  }
}
